import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pond_hockey/bloc/login/login_bloc.dart';
import 'package:pond_hockey/bloc/login/login_events.dart';
import 'package:pond_hockey/components/buttons/big_circle_btn.dart';
import 'package:pond_hockey/components/form/background.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({@required this.orientation});

  final Orientation orientation;

  @override
  State<StatefulWidget> createState() {
    return _CreateAccountFormState();
  }
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpButtonPressed() async {
    await BlocProvider.of<LoginBloc>(context).add(
      SignUpInitial(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const defaultDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      border: InputBorder.none,
    );

    return Container(
      width: widget.orientation == Orientation.portrait
          ? double.infinity
          : MediaQuery.of(context).size.width * 0.5,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                FormFieldBackground(
                  field: FormBuilderTextField(
                    attribute: 'email-sign_up',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: defaultDecoration.copyWith(labelText: 'Email'),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                  ),
                ),
                FormFieldBackground(
                  field: FormBuilderTextField(
                    attribute: 'password-sign_up',
                    controller: _passwordController,
                    obscureText: true,
                    maxLines: 1,
                    decoration:
                        defaultDecoration.copyWith(labelText: 'Password'),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ],
                  ),
                ),
                FormFieldBackground(
                  bottom: true,
                  field: FormBuilderTextField(
                    attribute: 'password-confirm',
                    controller: _confirmPasswordController,
                    obscureText: true,
                    maxLines: 1,
                    decoration: defaultDecoration.copyWith(
                      labelText: 'Confirm Password',
                    ),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      (value) {
                        var otherPassword = _formKey.currentState
                            .fields['password-sign_up'].currentState.value;
                        if (otherPassword == value) {
                          return null;
                        }
                        return 'Passwords must match';
                      }
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                BigCircleButton(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      FocusScope.of(context).unfocus();
                      _onSignUpButtonPressed();
                    }
                  },
                  text: 'Sign Up',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
