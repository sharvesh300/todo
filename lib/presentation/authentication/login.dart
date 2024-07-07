import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:note/buisness_logic/auth/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            } else if (state is AuthError) {
              Navigator.of(context).pop();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(state.message!),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Ok"))
                      ],
                    );
                  });
            } else if (state is AuthSuccess) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 300, child: Lottie.asset('assets/note2.json')),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: TextField(
                      obscureText: true,
                      controller: passController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await BlocProvider.of<AuthCubit>(context)
                            .login(emailController.text, passController.text);
                      },
                      child: Text("Login")),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        BlocProvider.of<AuthCubit>(context).googleSignIn();
                      },
                      child: Text("Login In With Google")),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Not have an account? Sign In"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
