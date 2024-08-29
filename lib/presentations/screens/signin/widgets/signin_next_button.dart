import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../utils/validator.dart';
import '../../../../router/router.gr.dart';

class YSigninNextButton extends StatelessWidget {
  const YSigninNextButton({
    super.key,
    required this.phoneController,
    required this.errorNotifier,
  });

  final TextEditingController phoneController;
  final ValueNotifier<String?> errorNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Validate phone number and update errorNotifier
          String? errorText = Validator.validatePhoneNumber(phoneController.text.trim());
          errorNotifier.value = errorText;

          // If no error, navigate to next screen
          if (errorText == null) {
            context.router.push(const VerificationRoute());
          }
        },
        child: const Text('Keyingi'),
      ),
    );
  }
}
