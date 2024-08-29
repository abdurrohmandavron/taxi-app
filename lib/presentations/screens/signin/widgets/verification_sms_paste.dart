import 'package:flutter/material.dart';

import '../../../../cubits/verification_cubit.dart';

class YVerificationSMSPaste extends StatelessWidget {
  const YVerificationSMSPaste({super.key, required this.cubit, required this.state});

  final YVerificationCubit cubit;
  final YVerificationState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cubit.pasteFromSMS(context),
      child: Container(
        height: 55,
        width: double.infinity,
        color: const Color(0xFFF8F8F8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(state.smsCode, style: Theme.of(context).textTheme.bodyMedium),
            Text("SMS dan qo'yish", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
