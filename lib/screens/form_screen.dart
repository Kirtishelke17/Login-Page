import 'package:flutter/material.dart';
import '../utils/validator.dart';
import '../widgets/custom_text_form_field.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailOrMobileController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  void _navigateToChatScreen(BuildContext context) {
    Navigator.pushNamed(context, '/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Instagram Log In Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            width: 400,
            height: 600,
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "asset/image/instagram.png",
                      height: 80,
                      width: 160,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        shadows: [
                          Shadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailOrMobileController,
                      hintText: "Email or Phone Number",
                      icon: Icons.person,
                      validator: Validator.validateEmailOrPhone,
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: passController,
                      hintText: "Password",
                      icon: Icons.lock,
                      obscureText: passToggle,
                      validator: Validator.validatePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        icon: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _navigateToChatScreen(context);
                            }
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print("Data Added Successfully");
                          emailOrMobileController.clear();
                          passController.clear();

                          _navigateToChatScreen(context);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
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
