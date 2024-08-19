import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:yollararo/router/router.gr.dart';

import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> with CodeAutoFill {
  final TextEditingController controller;
  final FocusNode focusNode;
  Timer? _timer;
  List<String> inputCode = ['', '', '', ''];
  String smsCode = '4182';

  VerificationCubit()
      : controller = TextEditingController(),
        focusNode = FocusNode(),
        super(VerificationState.initial()) {
    startTimer();
    listenForCode();
  }

  @override
  void codeUpdated() {
    emit(state.copyWith(smsCode: code!));
  }

  void startTimer() {
    _timer?.cancel();
    emit(state.copyWith(timeLeft: 120, isResendButtonEnabled: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0) {
        emit(state.copyWith(timeLeft: state.timeLeft - 1));
      } else {
        timer.cancel();
        emit(state.copyWith(isResendButtonEnabled: true));
      }
    });
  }

  void resendCode() {
    if (state.isResendButtonEnabled) {
      startTimer();
      // Add logic to resend OTP here
      emit(state.copyWith(isResendButtonEnabled: false));
    }
  }

  void codeChanged(BuildContext context, int index, String value) {
    if (value.length == 1) {
      inputCode[index] = value;

      if (index == 3) {
        if (inputCode.join() == smsCode) {
          context.router.replace(const HomeRoute());
        } else {
          emit(state.copyWith(borderColor: Colors.red));
        }
      }

      FocusScope.of(context).nextFocus();
    }
  }

  void pasteFromSMS(BuildContext context) {
    // SMS code equals OTP code
    smsCode == smsCode ? context.router.replace(const HomeRoute()) : emit(state.copyWith(borderColor: Colors.red));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    controller.dispose();
    focusNode.dispose();
    return super.close();
  }
}
