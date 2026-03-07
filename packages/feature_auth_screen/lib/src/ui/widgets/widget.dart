import 'package:feature_auth_screen/src/ui/bloc/bloc.build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreenWidget extends StatelessWidget {
  const AuthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: BlocBuilder<AuthScreenBloc, AuthScreenState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Email', errorText: state.emailError),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) =>
                      BlocProvider.of<AuthScreenBloc>(context).add(AuthScreenEvent.emailChanged(value)),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(labelText: 'Password', errorText: state.passwordError),
                  obscureText: true,
                  onChanged: (value) =>
                      BlocProvider.of<AuthScreenBloc>(context).add(AuthScreenEvent.passwordChanged(value)),
                ),
                const SizedBox(height: 8),
                if (state.failure != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Login failed. Please try again.',
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                const SizedBox(height: 16),
                if (state.isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<AuthScreenBloc>(context).add(AuthScreenEvent.loginSubmitted()),
                    child: const Text('Sign In'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
