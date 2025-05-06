import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_secure_storage/test/test_flutter_secure_storage_platform.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/shadow_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provider_info_widget.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/provvider_personal_data.dart';

class InhertedProviderProfile extends InheritedWidget {
  const InhertedProviderProfile({
    super.key,
    required super.child,
    required this.providerProfileModel,
  });
  final ProviderProfileModel providerProfileModel;

  @override
  bool updateShouldNotify(InhertedProviderProfile oldWidget) => true;

  static InhertedProviderProfile? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InhertedProviderProfile>();
}
