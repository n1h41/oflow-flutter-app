import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/utils/validators/validation.dart';
import 'package:oflow/features/auth/domain/usecase/params/params.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController _emailController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) => KValidator.validateEmail(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Last name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                ),
                validator: (value) => KValidator.validatePhoneNumber(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) => KValidator.validatePassword(value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
                  child: const Text('Sign up'),
                ),
              ),
              Row(
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      // Go to sign in view
                      context.replace('/auth/sign-in');
                    },
                    child: const Text('Sign in'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    final params = SignUpParams(
      email: _emailController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
    );
  }
}
