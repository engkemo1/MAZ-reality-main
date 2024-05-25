import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/loader.dart';
import 'package:final_project/features/login/logic/cubit/login_cubit.dart';
import 'package:final_project/features/login/logic/cubit/login_state.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  @override
  void dispose() {
    context.read<LoginCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Loading || current is SUCCESS || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            Loader.instance.show(context);
          },
          success: (loginResponse) {
            Loader.instance.hide();
            if (prefs?.getString("role") == "admin") {
              context.pushNamedAndRemoveUntil(Routes.lawyerScreen, predicate: (route) => false);
            } else {
              context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (route) => false);
            }
          },
          error: (error) {
            Loader.instance.hide();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font32DarkBlueMedium,
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font32BlueSemiBold,
            ))
      ],
    ),
  );
}

void setupSuccessState(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.check,
        color: Colors.green,
        size: 32,
      ),
      content: Text(
        message,
        style: TextStyles.font32DarkBlueMedium,
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font32BlueSemiBold,
            ))
      ],
    ),
  );
}
