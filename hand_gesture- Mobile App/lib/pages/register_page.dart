import 'package:flutter/material.dart';
import 'package:hand_gesture/components/my_button.dart';
import 'package:hand_gesture/components/my_text_field.dart';
import 'package:hand_gesture/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signUp() async {
    if (!_formKey.currentState!.validate()) {
      return; // If form is not valid, stop the sign-up process.
    }
    // Proceed with the authentication
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // Updated background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( // Allows for scrolling when the keyboard is visible
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.indigoAccent,
                    ),

                    const SizedBox(height: 50),

                    const Text(
                      "Let's get you set up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                     // validator: (value) => value!.isEmpty || !value.contains('@') ? "Enter a valid email" : null,
                    ),

                    const SizedBox(height: 10),

                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      //validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
                    ),

                    const SizedBox(height: 25),

                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      //validator: (value) => value != passwordController.text ? "Passwords do not match" : null,
                    ),

                    const SizedBox(height: 25),

                    MyButton(onTap: signUp, text: "Sign Up"),

                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
