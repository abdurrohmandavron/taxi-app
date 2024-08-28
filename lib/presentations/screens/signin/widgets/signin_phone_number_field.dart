import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YSigninPhoneNumberField extends StatelessWidget {
  const YSigninPhoneNumberField({
    super.key,
    required this.errorNotifier,
    required this.phoneController,
  });

  final ValueNotifier<String?> errorNotifier;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, errorText, child) {
        return TextFormField(
          expands: false,
          autofocus: true,
          controller: phoneController,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.titleMedium,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(9),
          ],
          decoration: InputDecoration(
            errorText: errorText,
            prefixText: "+998 ",
            contentPadding: const EdgeInsets.all(20),
            prefixStyle: Theme.of(context).textTheme.titleMedium,
            counter: const SizedBox(),
            labelText: "Telefon raqam",
          ),
        );
      },
    );
  }
}
