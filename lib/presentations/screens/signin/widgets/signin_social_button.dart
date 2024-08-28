import 'package:flutter/material.dart';

class YSigninSocialButton extends StatelessWidget {
  const YSigninSocialButton({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFECECED), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 30,
                  height: 30,
                  image: NetworkImage(image),
                ),
                const SizedBox(width: 4),
                Text(name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
