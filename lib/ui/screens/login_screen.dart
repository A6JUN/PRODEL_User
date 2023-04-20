import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:prodel_user/ui/screens/home_screen.dart';
import 'package:prodel_user/ui/screens/register_screen.dart';
import 'package:prodel_user/ui/widget/branding.dart';
import 'package:prodel_user/ui/widget/custom_alert_dialog.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/custom_input_form_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (Supabase.instance.client.auth.currentUser != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          reverse: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(),
                child: BlocConsumer<SignInBloc, SignInState>(
                  listener: (context, state) {
                    if (state is SignInFailureState) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                          title: "Login Failed",
                          message:
                              'Please check your email and password and try again.',
                          primaryButtonLabel: 'Ok',
                        ),
                      );
                    } else if (state is SignInSuccessState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomCard(
                      color: Colors.white.withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Branding(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Login with email and password',
                                style: GoogleFonts.cambay(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomInputFormField(
                                controller: _emailController,
                                prefixIcon: Icons.email_outlined,
                                labelText: 'Email',
                                validator: (value) {
                                  if (value != null &&
                                      value.trim().isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please enter an email";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomInputFormField(
                                controller: _passwordController,
                                labelText: 'Password',
                                prefixIcon: Icons.lock_outline_rounded,
                                isObscure: isObscure,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    isObscure = !isObscure;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.yellow[900],
                                  ),
                                ),
                                validator: (value) {
                                  if (value != null &&
                                      value.trim().isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please enter password";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                onTap: () {
                                  String email = _emailController.text.trim();
                                  String password =
                                      _passwordController.text.trim();

                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<SignInBloc>(context).add(
                                      SignInEvent(
                                        email: email,
                                        password: password,
                                      ),
                                    );
                                  }
                                },
                                label: 'Login',
                                isLoading: state is SignInLoadingState,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                color: Colors.yellow[800]!,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                                label: 'Register',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
