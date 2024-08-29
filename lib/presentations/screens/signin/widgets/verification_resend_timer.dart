import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../cubits/verification_cubit.dart';

class YVerificationResendTimer extends StatelessWidget {
  const YVerificationResendTimer({super.key, required this.cubit, required this.state});

  final YVerificationCubit cubit;
  final YVerificationState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => cubit.resendCode(),
          child: Text(
            "Qayta jo'natish",
            style: Theme.of(context).textTheme.bodyLarge!.apply(color: state.isResendButtonEnabled ? YColors.primary : Colors.grey),
          ),
        ),
        if (!state.isResendButtonEnabled)
          Text(
            "${state.timeLeft ~/ 60}:${(state.timeLeft % 60).toString().padLeft(2, '0')}",
            style: const TextStyle(fontSize: 14, color: YColors.primary, fontWeight: FontWeight.w800),
          ),
      ],
    );
  }
}
