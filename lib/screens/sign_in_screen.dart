import 'package:day2/widgets/custom-RadioGroup.dart';
import 'package:day2/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_switch.dart';
import '../widgets/custom_slider.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool checked = false; 
  double _sliderValue = 200.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Welcome Back.',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Let's sign in",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                 SizedBox(height: 30),
                CustomInputField(
                  hintText: 'Email',
                  controller: emailController,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  hintText: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off), 
                  obscureText: true,


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Recover Password',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                  Center(
                  child: Text(
                    '${_sliderValue.toStringAsFixed(0)} USD',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                CustomSlider(
                   value: _sliderValue,
                   min:100,
                   max: 1000,
                   divisions: 100,
                   label: _sliderValue.toStringAsFixed(1),
            onChanged: (val) {
              setState(() {
                _sliderValue = val;
              });
            },
          ),
                
                 CustomCheckbox(
              value: checked,
              title: "Checkbox Label",
              onChanged: (val) {
                setState(() {
                  checked = val!;
                });
              },
            ),
                CustomSwitch(
                  value: checked,
                  title: "Label",
                  onChanged: (val) {
                    setState(() {
                      checked = val!;
                    });
                  },
                ),
                              
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Logging in...');
                    }
                  },
                ),
                const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('or continue with'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/google 1.png', 
                  height: 24,
                ),
                label: const Text('Continue with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/facebook.png', 
                  height: 24,
                ),
                label: const Text('Continue with Facebook'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? '),
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
      
    );
  }
}
