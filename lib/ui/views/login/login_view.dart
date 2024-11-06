import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.grey,
            title: Center(child: Text('Loginpage',style: TextStyle(fontWeight: FontWeight.bold),))),
        body: Padding(

          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome App",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 35),),
              SizedBox(height: 30,),
              Text("Start Up Your Shopping Journey!!",style:TextStyle(fontWeight: FontWeight.w800,color: Colors.grey,fontSize: 25),),
              SizedBox(height: 40,),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,color: Colors.grey,),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.zero,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 26),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.grey,),

                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.zero,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 20),
              if (loginViewModel.isLoading) CircularProgressIndicator(),
              if (loginViewModel.errorMessage != null) Text(loginViewModel.errorMessage!, style: TextStyle(color: Colors.red)),
              Container(
                height:50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    _attemptLogin(context, _emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey,
                    side: BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void _attemptLogin(BuildContext context, String email, String password) async {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);

    final success = await loginViewModel.login(email, password);
    if (success) {
      // Navigate to Home screen on success
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loginViewModel.errorMessage ?? 'Login failed')),
      );
    }
  }
}
