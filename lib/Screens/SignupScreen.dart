import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = ' ';

  bool _obscurePassword = true;

  // TODO: 1. Membuat fungsi _signUp
  void _signUp() {
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // password invalid jika salah satu kondisi terpenuhi
    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]'))) {
      setState(() {
        _errorText = 
        'Minimal 8 karakter, kombinasi [A-Z], [a-z], [0-9], [!@#\$%^&*(),.?":{}|<>]';
      });
      return; 
    }

  }
   // TODO: 2. Membuat Fungsi Dispose

  @override
    void  dispose() {
     _nameController.dispose();
     _usernameController.dispose();
     _passwordController.dispose();
      super.dispose();
    }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column()),
        ) ,)
      )  
}
