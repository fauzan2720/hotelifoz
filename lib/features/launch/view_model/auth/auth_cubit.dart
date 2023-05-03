import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/view/pages/main_page.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';
import 'package:hotelifoz/features/launch/view/pages/splash_page.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserService _userService;
  final FirebaseAuthService _firebaseAuthService;
  UserModel? user;

  AuthCubit(
    this._userService,
    this._firebaseAuthService,
  ) : super(AuthInitial());

  void initData() async {
    emit(AuthLoading());
    try {
      final UserModel response = await _userService.getUser().first;
      user = response;
      emit(AuthSuccess(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void doLoginWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    context.loading();
    final response =
        await _firebaseAuthService.signInWithEmailAndPassword(email, password);
    response.fold((failed) {
      context.pop();
      failed.failedBar(context);
    }, (result) async {
      if (result) {
        await _userService.createUserIfNotExists();
        if (context.mounted) {
          context.read<AuthCubit>().initData();
          context.pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
          "Yeay! Login berhasil".succeedBar(context);
          context.read<PageCubit>().setPage(0);
        }
      } else {
        if (context.mounted) {
          context.pop();
          "Oppsss! Login gagal".failedBar(context);
        }
      }
    });
  }

  void doRegisterUserWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    context.loading();
    final response = await _firebaseAuthService
        .registerUserWithEmailAndPassword(email, password);
    response.fold((failed) {
      context.pop();
      failed.failedBar(context);
    }, (result) async {
      await _userService.createUserIfNotExists();
      if (context.mounted) {
        context.read<AuthCubit>().initData();
        context.pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
        "Yeay! Register berhasil".succeedBar(context);
        context.read<PageCubit>().setPage(0);
      }
    });
  }

  void doLogout(BuildContext context) async {
    await _firebaseAuthService.signOut();
    if (context.mounted) {
      context.pushNamedAndRemoveUntil(SplashPage.routeName, (route) => false);
    }
  }
}
