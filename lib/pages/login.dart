import 'package:flutter/material.dart';
import 'package:vta_mobile/pages/register.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/1-side.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Centered "Login" text with padding
              const Padding(
                padding: EdgeInsets.only(top: 350.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.black,
                  ),
                ),
              ),

              // Text box for email input with reduced height
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),

              // Text box for password input with reduced height
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: true, // Hide the password text
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),

              // Green button with white letters, increased font size, width of 200, and 10 corner radius
              Padding(
                padding: const EdgeInsets.only(
                    top: 100.0), // Add margin to the top of the button
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color of the button
                      onPrimary: Colors.white, // Text color of the button
                      textStyle: const TextStyle(
                          fontSize: 20.0), // Font size of the button text
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Corner radius of 10
                      ),
                      minimumSize: const Size(
                          200.0, 40), // Minimum width and height of the button
                    ),
                    child: const Text("Login"),
                  ),
                ),
              ),

              // "Not Registered yet? Sign Up" text with onPress function
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the RegisterScreen when "Sign Up" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Not Registered yet? ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0, // Change the color as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
