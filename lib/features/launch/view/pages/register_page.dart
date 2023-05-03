import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register_page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: context.fullHeight,
          width: context.fullWidth,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              80.0.height,
              Center(
                child: Text(
                  "Daftar Akun Baru 😎",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FW.medium,
                    color: context.color.textPrimary,
                  ),
                ),
              ),
              40.0.height,
              FozFormInput(
                controller: emailController,
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              12.0.height,
              FozFormInput(
                controller: passwordController,
                hint: 'Password',
                obscureText: true,
              ),
              20.0.height,
              FozFormButton(
                label: 'Daftar Sekarang',
                onPressed: () => context
                    .read<AuthCubit>()
                    .doRegisterUserWithEmailAndPassword(
                      context,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
              ),
              (context.fullHeight / 5).height,
            ],
          ).animate().fade(),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sudah punya akun? ",
              style: TextStyle(
                color: context.color.textPrimary,
              ),
            ),
            InkWell(
              onTap: () => context.pop(),
              child: Text(
                "Login yuk",
                style: TextStyle(
                  color: context.color.textPrimary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
