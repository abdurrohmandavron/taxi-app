import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yollararo/presentations/widgets/header.dart';
import 'package:yollararo/cubits/verification/verification_cubit.dart';
import 'package:yollararo/cubits/verification/verification_state.dart';
import 'package:yollararo/presentations/screens/signin/widgets/code_input_field.dart';

import '../../../utils/constants.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final cubit = context.read<VerificationCubit>();

          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    /// Title
                    const YHeader(title: "Telefon raqamni tasdiqlash", subTitle: "SMS orqali jo'natilgan kodni kiriting"),
                    const SizedBox(height: 16),

                    /// Body
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Input Pins
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) => YCodeInputField(index: index, cubit: cubit, state: state)),
                            ),
                            const SizedBox(height: 16),

                            /// Code Resend and Timer
                            Row(
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
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),

                    /// Paste from SMS
                    if (state.smsCode.isNotEmpty)
                      GestureDetector(
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
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
