import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              'Back',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.start,
            ),
            Container(
              height: 100,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  context.go("/home");
                },
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 70, 62, 62)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                )),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to signup screen
                context.go('/signup');
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              ),
              child: Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
