import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/delete_account_button.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/logout_button.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/more_button.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/more_provider_data.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/more_user_data.dart';

class MoreViewBody extends StatelessWidget {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Gap gap = const Gap(15);
    return ListView(
      children: [
        gap,
        const MoreProviderData(),
        const Gap(20),
        MoreButton(
          title: 'سياسه الخصوصيه',
          icon: IconManager.privacyPolicy,
          onTap: () {
            context.push(RouterPath.privacyPolicyView);
          },
        ),
        gap,
        MoreButton(
          title: 'الشروط و الاحكام',
          icon: IconManager.termsAndConditions,
          onTap: () {
            context.push(RouterPath.termsView);
          },
        ),
        gap,
        MoreButton(
          title: 'تواصل معنا',
          icon: IconManager.contactUs,
          onTap: () {},
        ),
        gap,
        MoreButton(
          title: 'نبذه عن التطبيق',
          icon: IconManager.info,
          onTap: () {},
        ),
        gap,
        LogoutButton(
          onTap: () {},
        ),
        gap,
        DeleteAccountButton(
          onTap: () {},
        )
      ],
    );
  }
}
