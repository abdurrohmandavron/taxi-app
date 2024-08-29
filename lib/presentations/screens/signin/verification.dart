import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/verification_cubit.dart';
import '../../../presentations/widgets/header.dart';
import '../../../presentations/screens/signin/widgets/verification_sms_paste.dart';
import '../../../presentations/screens/signin/widgets/verification_input_field.dart';
import '../../../presentations/screens/signin/widgets/verification_resend_timer.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YVerificationCubit(),
      child: BlocBuilder<YVerificationCubit, YVerificationState>(
        builder: (context, state) {
          final cubit = context.read<YVerificationCubit>();

          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    /// Title
                    const YHeader(
                      title: "Telefon raqamni tasdiqlash",
                      subTitle: "SMS orqali jo'natilgan kodni kiriting",
                    ),
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
                              children: List.generate(
                                4,
                                (index) => YVerificationInputField(
                                  index: index,
                                  cubit: cubit,
                                  state: state,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            /// Code Resend and Timer
                            YVerificationResendTimer(cubit: cubit, state: state),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),

                    /// Paste from SMS
                    if (state.smsCode.isNotEmpty) YVerificationSMSPaste(cubit: cubit, state: state),
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
