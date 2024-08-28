import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yollararo/utils/constants.dart';
import 'package:yollararo/presentations/widgets/header.dart';
import 'package:yollararo/presentations/screens/signin/widgets/signin_next_button.dart';
import 'package:yollararo/presentations/screens/signin/widgets/signin_social_button.dart';
import 'package:yollararo/presentations/screens/signin/widgets/signin_phone_number_field.dart';
import 'package:yollararo/presentations/screens/signin/widgets/signin_create_account_button.dart';

@RoutePage()
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final errorNotifier = ValueNotifier<String?>(null);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              /// Title
              const YHeader(title: "Hisobingizga kiring", subTitle: "Telefon raqamingizni kiriting"),
              const SizedBox(height: 16),

              /// Body
              Expanded(
                flex: 7,
                child: Container(
                  height: MediaQuery.of(context).size.height - 300,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Phone Number field
                      YSigninPhoneNumberField(errorNotifier: errorNotifier, phoneController: phoneController),

                      /// Forgot password Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Parolni unutdingizmi?",
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: YColors.primary),
                            ),
                          ),
                        ],
                      ),

                      /// Next Button
                      YSigninNextButton(phoneController: phoneController, errorNotifier: errorNotifier),
                      const SizedBox(height: 50),

                      /// Social SignIn Text
                      Text("Or login with account", style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 25),

                      /// Social Sign In Buttons
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: const Row(
                          children: [
                            /// Google Button
                            YSigninSocialButton(name: "Google", image: 'assets/logos/google-logo.png'),
                            SizedBox(width: 16),

                            /// Facebook button
                            YSigninSocialButton(name: "Facebook", image: 'assets/logos/facebook-logo.png'),
                          ],
                        ),
                      ),

                      /// Gap
                      const Spacer(),

                      /// Register text and button
                      const YSigninCreateAccountButton(),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
