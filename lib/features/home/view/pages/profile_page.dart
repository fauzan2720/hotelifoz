import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().initData();

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.primary, vertical: 20.0),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const FozLoading();
          } else if (state is AuthError) {
            return FozError(message: "Error: ${state.error}");
          } else if (state is AuthSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                60.0.height,
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(state.data.photo),
                ),
                16.0.height,
                Text(
                  state.data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                8.0.height,
                Text(
                  state.data.email,
                  style: const TextStyle(fontSize: 16),
                ),
                8.0.height,
                Text(
                  state.data.phoneNumber ?? "",
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                FozFormButton(
                  backgroundColor: AppColors.red,
                  label: "Logout",
                  onPressed: () => context.read<AuthCubit>().doLogout(context),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
