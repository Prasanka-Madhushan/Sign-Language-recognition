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

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController(); // Controller for username

  final _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<double> _animation;

  void signUp() async {
    if (!_formKey.currentState!.validate()) {
      return; // If form is not valid, stop the sign-up process.
    }
    // Proceed with the authentication
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(emailController.text,
          passwordController.text, usernameController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepOrange.shade300, Colors.purple],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formKey,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipPath(
                          clipper: TopCurvedClipper(),
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 150,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/logo/savvy7.png', // Replace with your image asset
                              width: 120,
                              height: 120,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          "Let's get you set up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.40),
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          height: 50,
                          child: MyTextField(
                            controller: usernameController,
                            hintText: 'User Name',
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 50,
                          child: MyTextField(
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 50,
                          child: MyTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 50,
                          child: MyTextField(
                            controller: confirmPasswordController,
                            hintText: 'Confirm Password',
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Transform.scale(
                          scale: 0.7,
                          child: MyButton(onTap: signUp, text: "Sign Up"),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: RichText(
                            text: TextSpan(
                              text: 'Already a member? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Login now',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        ClipPath(
                          clipper: BottomCurvedClipper(),
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 50);
    var controlPoint = Offset(size.width / 2, 0);
    var endPoint = Offset(size.width, 50);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
