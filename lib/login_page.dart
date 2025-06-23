import 'package:flutter/material.dart';
import 'package:flutter_app/Signup_page.dart';
import '../auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool passwordVisible = false;

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await _authService.login(email, password);
      // Navigate to home page or show success message
      Navigator.pushReplacementNamed(context, '/feed');
    } catch (e) {
      // Handle login error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(title: Text('Login'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            // Center(
            //   child: Text("Log In", 
            //     style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,
            //     color: Colors.blueAccent),
            //   ),
            // ),
            SizedBox(height: 50,),

            Container(
              alignment: Alignment.topLeft,
              child: Text("Welcome Back",
                style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: Icon(Icons.email),
                // border: OutlineInputBorder(),
              ),

            ),
              TextField(
                controller: _passwordController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                // border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(70, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50), // Makes button full width and sets height
                  ),
                
                onPressed: _login,
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              SizedBox(height: 20),
               TextButton(
                onPressed: () {
                  // Navigate to registration page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Forgot Password?',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
              ),
              SizedBox(height: 200,),
              TextButton(
                onPressed: () {
                  // Navigate to registration page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text('Don\'t have an account? Register here'),
              ),
            ],
          ),
        ),
      );
    }
  }