import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_redesign/services/auth_services.dart';
import 'package:instagram_redesign/widgets/auth_screen/text_field_container.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign_up_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  String _email, _password, _userName;
  File _profileImage;
  bool _isSigningUp = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      setState(() {
        _isSigningUp = true;
      });
      await AuthServices.signUpUser(
        context: context,
        userName: _userName,
        email: _email,
        password: _password,
        profileImage: _profileImage,
      );

      setState(() {
        _isSigningUp = false;
      });
    }
  }

  void _pickImage() async {
    final image = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );

    setState(() {
      _profileImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isSigningUp
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Instagram',
                        style: TextStyle(
                          fontFamily: 'Billabong',
                          fontSize: 60,
                        ),
                      ),
                      SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Color(0xffe6e6e6),
                                child: _profileImage == null
                                    ? Text(
                                        '+ Add a photo',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      )
                                    : null,
                                backgroundImage:
                                    _profileImage == null ? null : FileImage(_profileImage),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFieldContainer(
                              textFieldChild: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  // isCollapsed: true,
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }

                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                              ),
                            ),
                            TextFieldContainer(
                              textFieldChild: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  // isCollapsed: true,
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Please enter an username';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _userName = value;
                                },
                              ),
                            ),
                            TextFieldContainer(
                              textFieldChild: TextFormField(
                                controller: _passwordController,
                                textAlignVertical: TextAlignVertical.center,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value.length <= 5) {
                                    return 'Please enter atleaset 6 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value;
                                },
                              ),
                            ),
                            TextFieldContainer(
                              textFieldChild: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value != _passwordController.text) {
                                    return 'Passwords must match';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _signUp,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    onPrimary: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Already have an account',
                                style: TextStyle(
                                  // letterSpacing: 0.25,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
