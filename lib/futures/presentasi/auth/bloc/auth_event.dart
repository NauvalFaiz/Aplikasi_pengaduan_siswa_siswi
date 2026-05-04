

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// Event untuk login
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

// Event untuk register
class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [name, email, password, confirmPassword];
}

// Event untuk logout
class LogoutEvent extends AuthEvent {}

// Event untuk cek auth status (misal: app start)
class CheckAuthStatusEvent extends AuthEvent {}

// Event untuk update form (real-time validation)
class EmailChanged extends AuthEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends AuthEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class NameChanged extends AuthEvent {
  final String name;
  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class ConfirmPasswordChanged extends AuthEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}