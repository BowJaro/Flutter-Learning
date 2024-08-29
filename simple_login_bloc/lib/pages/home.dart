import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login_bloc/bloc/auth_bloc.dart';
import 'package:simple_login_bloc/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is AuthSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Home page"),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.uid),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthLogoutRequest());
                      },
                      child: const Text("Log Out")),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Unknown error occurred!"),
            ),
          );
        }
      },
    );
  }
}
