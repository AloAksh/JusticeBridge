import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'package:justice_bridge/models/user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/1234.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () async {
                String firstName = _firstNameController.text.trim();
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                Users? result = await _auth.registerWithEmailPassword(
                  firstName,
                  email,
                  password,
                );

                if (result == null) {
                  print('Error registering user');
                } else {
                  print('Registered user: ${result.uid}');
                }
              },
              child: Text('Register'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(onPressed: (){ Navigator.pushReplacementNamed(context, '/');}, child: const Text('Sign In')),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}