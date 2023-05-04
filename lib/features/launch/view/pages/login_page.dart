import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/launch/view/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Text(
                "Mari Kita Mulai 😁",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FW.medium,
                  color: context.color.textPrimary,
                ),
              ),
              14.0.height,
              const Text(
                "Yuk, login sekarang dan temukan penginapan impianmu dengan berbagai fasilitas istimewa yang kami sediakan!",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FW.medium,
                  color: AppColors.secondary,
                ),
                textAlign: TextAlign.center,
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
                label: 'Ayo Mulai',
                onPressed: () =>
                    context.read<AuthCubit>().doLoginWithEmailAndPassword(
                          context,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
              ),
              const SizedBox(
                height: 80.0,
                child: Divider(
                  color: AppColors.secondary,
                ),
              ),
              FozFormButton(
                backgroundColor: AppColors.primary,
                label: 'Lanjutkan dengan Google',
                onPressed: () =>
                    context.read<AuthCubit>().doLoginWithGoogle(context),
              ),
            ],
          ),
        ),
      ).animate().fade(),
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum punya akun? ",
              style: TextStyle(
                color: context.color.textPrimary,
              ),
            ),
            InkWell(
              onTap: () => context.pushNamed(RegisterPage.routeName),
              child: Text(
                "Daftar yuk",
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
