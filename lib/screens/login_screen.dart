import 'package:bt/screens/dashboard.dart';
import 'package:bt/screens/signup.dart';
import 'package:bt/services/auth_service.dart';
import 'package:bt/utils/appvalidator.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
class LoginView extends StatefulWidget {
  // ignore: use_super_parameters
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "email": _emailController.text,
        "password": _passwordController.text
      };

      await authService.login(data, context);
      //  Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => Dashboard()));
      setState(() {
        isLoader = false;
      });
    }
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter a valid email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter a Password';
    }
    return null;
  }

  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 10) {
      return 'Please enter a 10-digit number';
    }
    return null;
  }

  var appValidator = AppValidator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyForm'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 80.0),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Login Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Email", Icons.email),
                    validator: appValidator.validateEmail),
                SizedBox(height: 16.0),
                TextFormField(
                    controller: _passwordController,
                    // keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Password", Icons.lock),
                    validator: appValidator.validatePassword),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 241, 89, 0)),
                        onPressed: () {
                          isLoader ? print("Loading") : _submitForm();
                        },
                        //  / Call _submitForm method when button is pressed
                        child: isLoader
                            ? Center(child: CircularProgressIndicator())
                            : Text('Login', style: TextStyle(fontSize: 20)))),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupView()));
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 89, 0), fontSize: 20),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color(0xAA494A59),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(suffixIcon, color: Color(0xFF949494)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
