import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/buisness_logic/auth/auth_bloc.dart';
import 'package:note/data/repository/signIn/signRep.dart';
import 'package:note/presentation/authentication/login.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
               showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: CircularProgressIndicator(),
                      );
                    });
              } else if (state is AuthError) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(state.errorMessage!),
                      );
                    });
              }else if(state is AuthState){
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/note.json'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Name",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: TextField(
                      controller: passController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
                            emailController.text,
                            passController.text,
                            nameController.text));
                      },
                      child: const Text("Sign In")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Sign In With Google")),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text("Already have an account? Login"))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
