import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reactive_text_field_state.dart';

class ReactiveTextFieldCubit extends Cubit<ReactiveTextFieldState> {
  ReactiveTextFieldCubit(bool obscureText)
      : super(
          ReactiveTextFieldState(obscureText),
        );

  void toggleObscureText() {
    emit(
      ReactiveTextFieldState(!state.obscureText),
    );
  }
}
