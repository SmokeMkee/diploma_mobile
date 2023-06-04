import 'package:diploma_mobile/constants/app_assets.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:diploma_mobile/src/features/auth/sign/data/bloc/sign_bloc.dart';
import 'package:diploma_mobile/src/features/navigation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/auth_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<SignBloc, SignState>(
            listener: (context, state) {
             if(state is AuthSuccessSignIn){
               context.router.push(const PrimaryScreenRoute());
             }

            },
            child: AuthScreenWidget(
              headerTitle: 'Log in',
              fields: Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите email';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Email addresss',
                      textEditingController: emailController,
                      hintStyle: AppStyles.s15w400
                          .copyWith(color: AppColors.gray400),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: SvgPicture.asset(
                          AppAssets.svg.email,
                          color: AppColors.gray200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    AppTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите пароль';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Password',
                      hintStyle: AppStyles.s15w400
                          .copyWith(color: AppColors.gray400),
                      obscureText: _obscureText,
                      prefixIcon: IconButton(
                        onPressed: () {
                          _obscureText = !_obscureText;
                          setState(() {});
                        },
                        icon: SvgPicture.asset(
                          AppAssets.svg.password,
                          color: AppColors.gray200,
                        ),
                      ),
                      textEditingController: passwordController,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: IconButton(
                          onPressed: () {
                            _obscureText = !_obscureText;
                            setState(() {});
                          },
                          icon: SvgPicture.asset(
                            _obscureText == true
                                ? AppAssets.svg.slashEye
                                : AppAssets.svg.eye,
                            color: AppColors.gray200,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              elevatedButtonText: 'Log in',
              textForPassword: 'Don\'t have an account yet ? ',
              navigationButtonText: 'Registration',
              elevatedButtonOnTap: () {
                if (formKey.currentState?.validate() ?? false == true) {
                  context.read<SignBloc>().add(
                    AuthSignEvent(
                      password: passwordController.text.trim(),
                      email: emailController.text.trim(),
                    ),
                  );
                }
              },
              navigationButtonOnTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const ResetPasswordScreen()),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
