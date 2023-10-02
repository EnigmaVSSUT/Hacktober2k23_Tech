import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = true;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isObscure = true;
  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 254, 237, 208),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //GIF
                LottieBuilder.asset(
                  'lib/assets/login.json',
                  width: 280,
                ),
                // Text
                Text(
                  isLogin ? "LOGIN !!" : "SIGN-UP !!",
                  style: const TextStyle(fontSize: 25),
                ),
                //Email Field
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 5,
                    top: 20,
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        hintText: "Email address"),
                    onChanged: (txt) {
                      setState(() {});
                      if (txt.toString().contains("@gmail.com") != true) {
                        isEmailValid = false;
                      } else {
                        isEmailValid = true;
                      }
                    },
                  ),
                ),
                isEmailValid
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(""),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Please enter valid email address"),
                      ),
                //password Fields
                isLogin
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 25,
                          top: 8,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye_rounded)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            hintText: "Password",
                          ),
                          obscureText: isObscure ? true : false,
                        ),
                      )
                    :
                    //Validated Password
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 25,
                          top: 8,
                        ),
                        child: FancyPasswordField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye_rounded)),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            hintText: "Password",
                          ),
                          obscureText: isObscure ? true : false,
                          validationRules: {
                            DigitValidationRule(),
                            UppercaseValidationRule(),
                            LowercaseValidationRule(),
                            SpecialCharacterValidationRule(),
                            MinCharactersValidationRule(6),
                            MaxCharactersValidationRule(12),
                          },
                        ),
                      ),
                //Button
                GestureDetector(
                  onTap: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(isLogin
                              ? "Login-Successful"
                              : "Sign-Up Successful"),
                        ),
                      );
                    }
                  },
                  child: Container(
                    color: Colors.orangeAccent.shade100,
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text(isLogin ? "Log-in" : "Sign-Up"),
                    ),
                  ),
                ),
                //Forgot password
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isLogin = !isLogin;
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      isLogin
                          ? "New user? Sign-Up Instead..."
                          : "Login instead?...",
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
