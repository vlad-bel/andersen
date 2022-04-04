part of 'reactive_text_field_cubit.dart';

class ReactiveTextFieldState extends Equatable {
  const ReactiveTextFieldState(
    this.obscureText,
  );

  final bool obscureText;

  @override
  List<Object> get props => [obscureText];
}
