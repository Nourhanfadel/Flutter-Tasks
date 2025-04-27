import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_slider.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_switch.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isCheckboxChecked = false;
  bool _isSwitchOn = false;
  double _sliderValue = 50;

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Welcome Back.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Let's sign up",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // Full Name
                CustomInputField(
                  hintText: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
                  controller: _fullNameController,
                  validator: _validateField,
                ),

                // Email
                CustomInputField(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  controller: _emailController,
                  validator: _validateField,
                ),

                // Password
                CustomInputField(
                  hintText: 'Password',
                  label: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  isPassword: true,
                  controller: _passwordController,
                  validator: _validateField,
                ),

                // Confirm Password
                CustomInputField(
                  hintText: 'Confirm Password',
                  label: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: _validateConfirmPassword,
                ),

                const SizedBox(height: 20),

                // 200 USD Text
                Center(
                  child: Text(
                    '${_sliderValue.toStringAsFixed(0)} USD',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),

                // Custom Slider
                CustomSlider(
                  value: _sliderValue,
                   label: _sliderValue.toStringAsFixed(0),
                  min: 0,
                  max: 500,
                  divisions: 50,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),


                 CustomCheckbox(
                  title: 'checkbox label',
                  value: _isCheckboxChecked,
                  onChanged: (value) {
                    setState(() {
                      _isCheckboxChecked = value!;
                    });
                  },
                ),

                // Custom Switch
                CustomSwitch(
                  title: 'label',
                  value: _isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      _isSwitchOn = value;
                    });
                  },
                ),

                const SizedBox(height: 10),

                // Custom Checkbox
               
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Valid
                        print('Signed Up!');
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        print('Navigate to Sign In');
                      },
                      child: const Text(
                        'Sign In!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
