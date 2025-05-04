import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/category_service_container.dart';
import '../../../../../../core/helper/loading_indicator.dart';
import '../../../domain/entities/offered_services_entity.dart';
import '../../manager/GetCategoryServices/get_category_services_cubit.dart';
import '../../manager/GetCategoryServices/get_category_services_states.dart';

class OfferedServicesListView extends StatefulWidget {
  const OfferedServicesListView({super.key, required this.categoryId});
  final String categoryId;
  @override
  State<OfferedServicesListView> createState() =>
      _OfferedServicesListViewState();
}

class _OfferedServicesListViewState extends State<OfferedServicesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCategoryServicesCubit>(context)
        .getCategoryServices(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryServicesCubit, GetCategoryServicesStates>(
        builder: (context, state) {
      if (state is GetCategoryServicesLoading) {
        return const CustomLoadingIndicator();
      } else if (state is GetCategoryServicesSuccess) {
        final services = state.services;
        return ListView.separated(
            itemCount: services.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
                     final OfferedServicesEntity service = services[index];
             return CategoryServiceContainer(
              name: service.name,
              desc: service.desc,
              price: '${service.price}',
              date: service.date,
              img: service.img,
              providerImg: service.providerImg,
              providerName: service.providerName,
            
             );
            });
      } else if (state is GetCategoryServicesFailure) {
        return Text(state.error);
      } else {
        return const Text('unknown');
      }
    });
  }
}
