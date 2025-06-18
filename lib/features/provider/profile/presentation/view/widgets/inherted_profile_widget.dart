import 'package:flutter/material.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';

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
