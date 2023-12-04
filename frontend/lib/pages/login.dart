import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth.dart';
import 'package:justice_bridge/models/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth =AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/1234.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30.0),

              ElevatedButton(
                // onPressed: () {
                //     // Implement sign-in logic here
                //     Navigator.pushReplacementNamed(context, '/home');
                //   },
                // onPressed: () async{
                //   dynamic result = await _auth.signInAnon();
                //   if(result==null)
                //   {
                //     print("error Signing in");
                //   }
                //   else{
                //     print('signed in');
                //     print(result.uid);
                //   }
                // },
                onPressed: () async {
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();
                
                  if(email.isEmpty) {
                    dynamic result = await _auth.signInAnon();
                    if(result==null)
                    {
                      print("error Signing in"); 
                    }
                    else{
                      print('signed in');
                      print(result.uid);
                    }
                  }
                  else{
                    Users? result = await _auth.signInWithEmailPassword(
                        email, password);
                    if (result == null) {
                      print('Error signing in');
                    } else {
                      Navigator.pushReplacementNamed(context, '/home');
                      print('Signed in: ${result.uid}');
                      
                    }
                  }
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: (){ Navigator.pushReplacementNamed(context, '/register');}, child: const Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
