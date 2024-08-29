import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../router/router.gr.dart';

class YVerificationCubit extends Cubit<YVerificationState> with CodeAutoFill {
  final TextEditingController controller;
  final FocusNode focusNode;
  Timer? _timer;

  List<String> inputCode = List.generate(4, (_) => '');
  late String otpCode;
  late String smsCode;

  YVerificationCubit()
      : controller = TextEditingController(),
        focusNode = FocusNode(),
        super(YVerificationState.initial()) {
    sendOTP();
    startTimer();
    listenForCode();
  }

  @override
  void codeUpdated() {
    emit(state.copyWith(smsCode: code!));
  }

  Future<void> sendOTP() async {
    otpCode = (1000 + Random().nextInt(9000)).toString();
    Dio().get('https://api.telegram.org/bot6238255518:AAEYg3x2-rA6uCcv3HK5fbCpB-MnHMOn6T4/sendMessage?chat_id=6559889263&text=$otpCode');
    smsCode = otpCode;
    emit(state.copyWith(smsCode: smsCode));
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
      sendOTP();
      emit(state.copyWith(isResendButtonEnabled: false));
    }
  }

  void codeChanged(BuildContext context, int index, String value) {
    if (value.length == 1) {
      inputCode[index] = value;

      if (inputCode.join() == otpCode) {
        context.router.replace(const HomeRoute());
      } else {
        if (index == 3) emit(state.copyWith(borderColor: Colors.red));
      }

      if (index != 3) FocusScope.of(context).nextFocus();
    }
  }

  void pasteFromSMS(BuildContext context) {
    if (smsCode == otpCode) {
      context.router.replace(const HomeRoute());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("SMS kod noto'g'ri")));
      emit(state.copyWith(borderColor: Colors.red));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    controller.dispose();
    focusNode.dispose();
    return super.close();
  }
}

class YVerificationState {
  final int timeLeft;
  final bool isResendButtonEnabled;
  final Color borderColor;
  final String smsCode;

  YVerificationState({
    required this.timeLeft,
    required this.isResendButtonEnabled,
    required this.borderColor,
    required this.smsCode,
  });

  factory YVerificationState.initial() {
    return YVerificationState(
      timeLeft: 120,
      isResendButtonEnabled: false,
      borderColor: Colors.grey,
      smsCode: '0000',
    );
  }

  YVerificationState copyWith({
    int? timeLeft,
    bool? isResendButtonEnabled,
    Color? borderColor,
    String? smsCode,
  }) {
    return YVerificationState(
      timeLeft: timeLeft ?? this.timeLeft,
      isResendButtonEnabled: isResendButtonEnabled ?? this.isResendButtonEnabled,
      borderColor: borderColor ?? this.borderColor,
      smsCode: smsCode ?? this.smsCode,
    );
  }
}
