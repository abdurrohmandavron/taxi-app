import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../cubits/verification_cubit.dart';

class YVerificationInputField extends StatelessWidget {
  const YVerificationInputField({
    super.key,
    required this.index,
    required this.cubit,
    required this.state,
  });

  final int index;
  final YVerificationCubit cubit;
  final YVerificationState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: state.borderColor), borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: state.borderColor), borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: state.borderColor), borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) => cubit.codeChanged(context, index, value),
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
