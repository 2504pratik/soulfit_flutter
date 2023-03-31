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
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      obscureText: true,
      controller: _passwordController,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(),
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
          style: TextStyle(color: Colors.black, fontSize: 25),
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
          style: TextStyle(color: Colors.black, fontSize: 25),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _isLoginForm ? _buildLoginForm() : _buildCreateAccountForm(),
      ),
    );
  }
}
