import 'package:apple_ecommerce/providers/auth_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/buttons/custom_button.dart';
import 'widgets/custom_text_fields.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String type = 'signup';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            Consumer<AuthScreenProvider>(builder: (context, authStates, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/auth_banner.jpeg',
                        ))),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type == 'signup'
                          ? 'Create Account'
                          : type == 'signin'
                              ? "Sign In"
                              : 'Forgot Password',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                    Text(
                      type == 'signup'
                          ? 'Sign Up with Your User Account'
                          : type == 'signin'
                              ? "Connect with your user account"
                              : 'Please enter your email for get reset mail',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade800),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hint: 'Email',
                      prefixIcon: Icons.email,
                      controller: authStates.emailController,
                    ),
                    type != 'forgot'
                        ? CustomTextField(
                            hint: 'Password',
                            controller: authStates.passwordController,
                            prefixIcon: Icons.password_rounded,
                            isPassword: true,
                          )
                        : const SizedBox(),
                    type != 'signin'
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    type = 'forgot';
                                  });
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                    type == 'signup'
                        ? CustomTextField(
                            hint: 'Confirm Password',
                            controller: authStates.confirmPasswordController,
                            prefixIcon: Icons.password_rounded,
                            isPassword: true,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      size: size,
                      text: type == 'signup'
                          ? 'Sign Up'
                          : type == 'signin'
                              ? 'Sign In'
                              : 'Send Reset Email',
                      ontap: () {
                        if (type == 'signup') {
                          authStates.startSignUp(context);
                        }else if (type == 'signin'){
                          authStates.startSignIn(context);
                        }
                      },
                    ),
                    CustomButton(
                      size: size,
                      text: type == 'signup'
                          ? 'Sign In'
                          : type == 'signin'
                              ? 'Sign Up'
                              : 'Cancel',
                      ontap: () {
                        authStates.clearFields();
                        setState(() {
                          if (type == 'signin') {
                            type = 'signup';
                          } else if (type == 'signup') {
                            type = 'signin';
                          } else {
                            type = 'signup';
                          }
                        });
                      },
                      bgColor: Colors.white,
                      fontColor: Colors.black,
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
