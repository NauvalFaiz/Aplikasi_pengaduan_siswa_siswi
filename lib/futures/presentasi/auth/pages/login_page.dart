// lib/features/auth/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            // Navigasi ke Home
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final loginState = state is LoginFormState
                ? state
                : const LoginFormState();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: loginState.emailError,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        context.read<AuthBloc>().add(EmailChanged(value)),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: loginState.passwordError,
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) =>
                        context.read<AuthBloc>().add(PasswordChanged(value)),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: loginState.isValid
                        ? () {
                            context.read<AuthBloc>().add(
                              LoginEvent(
                                email: loginState.email,
                                password: loginState.password,
                              ),
                            );
                          }
                        : null,
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Belum punya akun? Daftar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
