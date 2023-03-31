import 'package:flutter/material.dart';
import 'package:soulfit/home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginForm = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _toggleForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: Color.fromRGBO(159, 191, 193, 0.5),
        labelText: 'Email',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: Color.fromRGBO(159, 191, 193, 0.5),
        labelText: 'Password',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      obscureText: true,
      controller: _passwordController,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: Color.fromRGBO(159, 191, 193, 0.5),
        labelText: 'Confirm Password',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      obscureText: true,
      controller: _confirmPasswordController,
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sign In',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        _buildEmailTextField(),
        const SizedBox(height: 16.0),
        _buildPasswordTextField(),
        const SizedBox(height: 16.0),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(44, 105, 117, 1))),
          onPressed: () {
            // Implement login functionality
            FocusScope.of(context).unfocus();
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const HomePage())));
          },
          child: const Text('Log In'),
        ),
        const SizedBox(height: 16.0),
        TextButton(
          onPressed: _toggleForm,
          child: const Text(
            'Don\'t have an account? Create one',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateAccountForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Create Account',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        _buildEmailTextField(),
        const SizedBox(height: 16.0),
        _buildPasswordTextField(),
        const SizedBox(height: 16.0),
        _buildConfirmPasswordTextField(),
        const SizedBox(height: 16.0),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(44, 105, 117, 1))),
          onPressed: () {
            // Implement create account functionality
            FocusScope.of(context).unfocus();
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const HomePage())));
          },
          child: const Text('Create Account'),
        ),
        const SizedBox(height: 16.0),
        TextButton(
          onPressed: _toggleForm,
          child: const Text(
            'Already have an account? Log in',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                ),
                color: const Color.fromRGBO(44, 105, 117, 1),
              ),
              height: 300,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  _isLoginForm ? _buildLoginForm() : _buildCreateAccountForm(),
            ),
          ],
        ),
      ),
    );
  }
}
