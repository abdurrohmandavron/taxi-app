import 'package:flutter/material.dart';

class VerificationState {
  final int timeLeft;
  final bool isResendButtonEnabled;
  final Color borderColor;
  final String smsCode;

  VerificationState({
    required this.timeLeft,
    required this.isResendButtonEnabled,
    required this.borderColor,
    required this.smsCode,
  });

  factory VerificationState.initial() {
    return VerificationState(
      timeLeft: 120,
      isResendButtonEnabled: false,
      borderColor: Colors.grey,
      smsCode: '4182',
    );
  }

  VerificationState copyWith({
    int? timeLeft,
    bool? isResendButtonEnabled,
    Color? borderColor,
    String? smsCode,
  }) {
    return VerificationState(
      timeLeft: timeLeft ?? this.timeLeft,
      isResendButtonEnabled: isResendButtonEnabled ?? this.isResendButtonEnabled,
      borderColor: borderColor ?? this.borderColor,
      smsCode: smsCode ?? this.smsCode,
    );
  }
}
