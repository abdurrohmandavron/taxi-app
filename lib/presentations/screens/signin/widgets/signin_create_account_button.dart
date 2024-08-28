import 'package:flutter/material.dart';
import 'package:yollararo/utils/constants.dart';

class YSigninCreateAccountButton extends StatelessWidget {
  const YSigninCreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hisobingiz yo'qmi?", style: Theme.of(context).textTheme.bodyLarge!.apply(color: const Color(0xFF6C7278))),
        const SizedBox(width: 4),
        TextButton(onPressed: () {}, child: Text("Ro'yxatdan o'ting", style: Theme.of(context).textTheme.titleMedium!.apply(color: YColors.primary))),
      ],
    );
  }
}
