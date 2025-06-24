import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/shared/auth/presentation/views/widgets/custom_button.dart';
import 'package:grad_project/features/user/home/presentation/manager/GetEmergencyProviders/get_emergency_providers_states.dart';
import 'package:grad_project/features/user/home/presentation/manager/RequestEmergency/request_emergency_cubit.dart';
import 'package:grad_project/features/user/home/presentation/manager/RequestEmergency/request_emergency_states.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/drop_down_list.dart';
import '../../../../../shared/auth/presentation/views/widgets/custom_text_field.dart';
import '../request_service_view.dart';
import 'custom_app_bar.dart';
import 'emergency_offers_list_view.dart';
import '../../manager/GetEmergencyProviders/get_emergency_providers_cubit.dart';
import 'pop_up_emergency.dart';

class EmergencyViewBody extends StatefulWidget {
  const EmergencyViewBody({super.key});

  @override
  State<EmergencyViewBody> createState() => _EmergencyViewBodyState();
}

class _EmergencyViewBodyState extends State<EmergencyViewBody> {
  String? category, desc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void rejectOffer(int index) {
    final cubit = context.read<GetEmergencyProvidersCubit>();
    if (cubit.state is GetEmergencyProvidersSuccess) {
      final currentOffers =
          List.of((cubit.state as GetEmergencyProvidersSuccess).offers);
      currentOffers.removeAt(index);
    }
  }

  void acceptOffer(dynamic offer) {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestEmergencyCubit, RequestEmergencyStates>(
      listener: (context, state) async {
        if (state is RequestEmergencySuccess) {
          final requestId = state.requestId;
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) => const PopUpEmergency(),
          );

          await Future.delayed(const Duration(seconds: 8));
          context
              .read<GetEmergencyProvidersCubit>()
              .getEmergencyProviders(requestId);
        }

        if (state is RequestEmergencyFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('فشل الإرسال: ${state.error}')),
          );
        }

        if (state is RequestEmergencySuccess ||
            state is RequestEmergencyFailure) {
          setState(() => isLoading = false);
        }
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(title: 'Emergency'),
                      Center(
                        child: Image.asset(
                          'assets/images/emergency.jpg',
                          width: context.responsiveWidth(200),
                          height: context.responsiveHeight(200),
                        ),
                      ),
                      const Gap(5),
                      Center(
                        child: Text(
                          'طلب مساعدة طارئة',
                          style: TextStyleManager.style20BoldBlack,
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        'هل تواجه مشكلة عاجلة؟ احصل على الدعم السريع من أقرب مقدم خدمة متاح الآن',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      const TitleWidget(title: 'نوع الطوارئ'),
                      DropDownList(
                        hint: 'اختر القسم',
                        onCategorySelected: (id) {
                          setState(() {
                            category = id;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      const TitleWidget(title: 'وصف المشكلة'),
                      CustomTextField(
                        title: '',
                        onSaved: (val) => desc = val,
                        maxLines: 4,
                      ),
                      const Gap(20),
                      CustomButton(
                        text: isLoading ? '... جار الإرسال' : 'ارسال',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            setState(() => isLoading = true);

                            BlocProvider.of<RequestEmergencyCubit>(context)
                                .requestEmergency(
                              category!,
                              desc!,
                            );
                          }
                        },
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            child: Expanded(
              child: EmergencyOffersListView(),
            ),
          )
        ],
      ),
    );
  }
}
