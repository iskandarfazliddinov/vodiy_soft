import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodiy_soft/config/routes/router.gr.dart';
import 'package:vodiy_soft/core/resources/app_colors.dart';
import 'package:vodiy_soft/core/resources/state_status.dart';
import 'package:vodiy_soft/core/resources/styles.dart';
import 'package:vodiy_soft/core/widgets/unfocus.dart';
import 'package:vodiy_soft/core/widgets/w_button.dart';
import 'package:vodiy_soft/core/widgets/w_checkbox_group.dart';
import 'package:vodiy_soft/core/widgets/w_form_loader.dart';
import 'package:vodiy_soft/core/widgets/w_textfield.dart';
import 'package:vodiy_soft/features/login/data/dto/login_request_dto.dart';
import 'package:vodiy_soft/features/login/presantation/state/login/login_bloc.dart';


@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<TextEditingController> controllers = [];

  FocusNode focusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  @override
  void initState() {
    controllers = [
      controller,
      passwordController,
    ];
    super.initState();
  }

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(loginRepo: context.read()),
      child: Unfocus(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginInitial &&
                      state.status == StateStatus.error) {
                    if (state.errorData?['value'] != null) {
                      setFocus(focusNode);
                    } else if (state.errorData?['password'] != null) {
                      setFocus(passwordFocusNode);
                    }
                  } else if (state is Success) {
                    context.router.replaceAll([const AppMainRoute()]);
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if(state is LoginInitial){
                      return Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Login",
                                style: Styles.getTextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WTextField(
                                    label: 'Login',
                                    focusNode: focusNode,
                                    controller: controller,
                                    hint: 'login',
                                    errorText: state.errorData?['value'],
                                    keyboardType: TextInputType.text,
                                    // errorText: state.errorData?['value'],
                                  ),
                                  WTextField(
                                    label: 'Password',
                                    focusNode: passwordFocusNode,
                                    controller: passwordController,
                                    hint: 'password',
                                    isObscure: true,
                                    errorText: state.errorData?['password'],
                                    keyboardType: TextInputType.visiblePassword,
                                    onSubmitted: (str) {
                                      _callBloc(
                                        event: SendCredentials(
                                          loginRequestDto: LoginRequestDto(
                                            username: controller.text,
                                            password: passwordController.text,
                                          ),
                                        ), context: context,
                                      );
                                    },
                                  ),
                                  state.errorData?['error']!= null ?Text(state.errorData?['error']??"",style: Styles.getTextStyle(color: AppColors.danger,fontSize: 16),):const SizedBox(),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: WButton(
                                  textStyle: Styles.getTextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  text: 'Login',
                                  onTap: () {
                                    _callBloc(
                                      event: SendCredentials(
                                        loginRequestDto: LoginRequestDto(
                                          password: passwordController.text, username: controller.text,
                                        ),
                                      ), context: context,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          if (state.status == StateStatus.loading) ...{
                            const WFormLoader(),
                          }
                        ],
                      );
                    }else{
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _callBloc({required BuildContext context, required LoginEvent event}) {
    FocusScope.of(context).unfocus();
    context.read<LoginBloc>().add(event);
  }

  void setFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void dispose() {
    for (var i in controllers) {
      i.dispose();
    }
    super.dispose();
  }
}
