import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/features/provider/profile/presentation/view/widgets/service_provider_profile_body.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    const fieldColor = Color(0xFFF6F7F9);
    return Scaffold(
      appBar: AppBar(
        primary: true,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'تواصل معنا',
          style: TextStyleManager.style18BoldSec,
        ),
        centerTitle: true,
        leading: const BackIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'نسعد بتواصلكم معنا ، ونرحب بأي استفسار أو ملاحظة أو اقتراح. لا تتردد في التواصل معنا عبر تعبئة الاستمارة التالية. إننا نقدر رسالتك وسنرد عليها في أقرب وقت ممكن.',
                    style: TextStyleManager.style16RegSec,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(30),
                const _FieldLabel('الاسم *'),
                _ContactField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'الرجاء إدخال الاسم';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const _FieldLabel('البريد الالكتروني *'),
                _ContactField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'الرجاء إدخال البريد الإلكتروني';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'الرجاء إدخال بريد إلكتروني صحيح';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const _FieldLabel('موضوع الرسالة *'),
                _ContactField(
                  controller: _subjectController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'الرجاء إدخال موضوع الرسالة';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                const _FieldLabel('الرسالة *'),
                _ContactField(
                  controller: _messageController,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'الرجاء إدخال الرسالة';
                    }
                    return null;
                  },
                ),
                const Gap(30),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF25A9E0),
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم إرسال الرسالة بنجاح'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: Text(
                        'إرسال',
                        style: TextStyleManager.style16BoldWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 4),
      child: Text(
        label,
        style: TextStyleManager.style16BoldBlack,
        textAlign: TextAlign.start,
      ),
    );
  }
}

class _ContactField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const _ContactField({
    this.hint = '',
    this.maxLines = 1,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F7F9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
        hintStyle: TextStyleManager.style16RegSec,
      ),
      textAlign: TextAlign.start,
    );
  }
}
