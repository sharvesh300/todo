import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/buisness_logic/auth/auth_cubit.dart';
import 'package:note/presentation/authentication/login.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    return Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
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
          print(state.user);
          Navigator.of(context);
        }
      },
      child: SingleChildScrollView(
          child: Container(
              child: Column(
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
              textInputAction: TextInputAction.next,
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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
              obscureText: true,
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
                if (emailController.text != null &&
                    passController.text != null &&
                    nameController.text != null) {
                  BlocProvider.of<AuthCubit>(context).signUp(
                      emailController.text,
                      passController.text,
                      nameController.text);
                } else {
                  null;
                }
              },
              child: const Text("Sign In")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).googleSignIn();
              },
              child: const Text("Sign In With Google")),
          const SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => AuthCubit(),
                              child: LoginPage(),
                            )));
              },
              child: const Text("Already have an account? Login"))
        ],
      ))),
    ));
  }
}
