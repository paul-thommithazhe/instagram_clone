import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/constants.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_input_field.dart';
import 'dart:developer';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bioController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  final sizedBox = const SizedBox(height: 25);
  Uint8List? _image;
  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //svg image
                    SizedBox(height: 50),
                    SvgPicture.asset('assets/ic_instagram.svg',
                        color: primaryColor, height: 64),
                    const SizedBox(height: 40),
                    //circluar widget to accept and show our selected file

                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOIgbiAwf6mBkjE6iVQuxHMAHMXlcYvkshKJ9Tx-bexaRCbpR7WJNs7t_qh3Z4I8qe8HQ&usqp=CAU'),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: () {
                              selectImage();
                            },
                            icon: const Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBox,
                    //textfield for username
                    TextFieldInput(
                      textEditingController: _usernameController,
                      hintText: 'Enter your username',
                      textInputType: TextInputType.text,
                    ),

                    //textfield input for email
                    sizedBox,
                    TextFieldInput(
                      textEditingController: _emailController,
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                    ),
                    sizedBox,
                    //textfield input for password
                    TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: 'Enter your password',
                      textInputType: TextInputType.text,
                      isPassword: true,
                    ),
                    sizedBox,
                    //textfield input for bio
                    TextFieldInput(
                      textEditingController: _bioController,
                      hintText: 'Enter your bio',
                      textInputType: TextInputType.text,
                    ),
                    sizedBox,
                    //button for login
                    InkWell(
                      onTap: () async {
                        log('coming to singup button ........................');
                        String result = await AuthMethods().signupUser(
                          username: _usernameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          bio: _bioController.text,
                          file: _image!,
                        );
                        log(_emailController.text);
                        log(result);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: blueColor,
                        ),
                        child: const Text("Sign up"),
                      ),
                    ),
                    const SizedBox(height: 50),

                    //Transitioning to signup page
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: const Text('Don\'t have an account? '),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
