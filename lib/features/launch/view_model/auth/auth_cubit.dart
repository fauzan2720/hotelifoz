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
      final response = await _userService.getUser().first;
      response.fold(
        (failed) => emit(AuthError(failed)),
        (result) {
          user = result;
          emit(AuthSuccess(user!));
        },
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void doLoginWithGoogle(BuildContext context) async {
    context.loading();
    final response = await _firebaseAuthService.signInWithGoogle();
    response.fold((failed) {
      context.pop();
      failed.failedBar(context);
    }, (result) {
      if (result) {
        _createUserIfNotExists(context, messageSuccess: "Yeay! Login berhasil");
      } else {
        context.pop();
        "Oppsss! Ada yang salah nih".failedBar(context);
      }
    });
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
    }, (result) {
      if (result) {
        _createUserIfNotExists(context, messageSuccess: "Yeay! Login berhasil");
      } else {
        context.pop();
        "Oppsss! Ada yang salah nih".failedBar(context);
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
    }, (result) {
      if (result) {
        _createUserIfNotExists(context,
            messageSuccess: "Yeay! Register berhasil");
      } else {
        context.pop();
        "Oppsss! Ada yang salah nih".failedBar(context);
      }
    });
  }

  void _createUserIfNotExists(
    BuildContext context, {
    required String messageSuccess,
  }) async {
    final response = await _userService.createUserIfNotExists();
    response.fold((failed) {
      context.pop();
      failed.failedBar(context);
    }, (result) {
      if (result) {
        context.read<AuthCubit>().initData();
        context.pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
        messageSuccess.succeedBar(context);
        context.read<PageCubit>().setPage(0);
      } else {
        context.pop();
        "function createUserIfNotExists fail".failedBar(context);
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
