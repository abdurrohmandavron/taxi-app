import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yollararo/utils/constants.dart';
import 'package:yollararo/router/router.gr.dart';
import 'package:yollararo/presentations/widgets/header.dart';

@RoutePage()
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

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
                      TextFormField(
                        maxLength: 9,
                        expands: false,
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        style: Theme.of(context).textTheme.titleMedium,
                        // validator: (value) => Validator.validatePhoneNumber(value),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          prefixText: "+998 ",
                          contentPadding: const EdgeInsets.all(20),
                          prefixStyle: Theme.of(context).textTheme.titleMedium,
                          counter: const SizedBox(),
                          labelText: "Telefon raqam",
                        ),
                      ),

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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.router.replace(const VerificationRoute()),
                          child: const Text('Keyingi'),
                        ),
                      ),
                      const SizedBox(height: 50),

                      /// Social Sign In with Text
                      Text("Or login with account", style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: 25),

                      /// Social Sign In Buttons
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            /// Google Button
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFECECED), width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.g_mobiledata),
                                        SizedBox(width: 4),
                                        Text("Google"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            /// Facebook button
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFECECED), width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.facebook),
                                        SizedBox(width: 4),
                                        Text("Facebook"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Gap
                      const Spacer(),

                      /// Register text and button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hisobingiz yo'qmi?", style: Theme.of(context).textTheme.bodyLarge!.apply(color: const Color(0xFF6C7278))),
                          const SizedBox(width: 4),
                          TextButton(onPressed: () {}, child: Text("Ro'yxatdan o'ting", style: Theme.of(context).textTheme.titleMedium!.apply(color: YColors.primary))),
                        ],
                      ),
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
