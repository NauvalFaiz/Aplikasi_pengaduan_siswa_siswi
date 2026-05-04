// lib/features/auth/bloc/auth_bloc.dart
import 'dart:convert';
import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Event untuk login
    on<LoginEvent>(_onLogin);

    // Event untuk register
    on<RegisterEvent>(_onRegister);

    // Event untuk logout
    on<LogoutEvent>(_onLogout);

    // Event untuk cek auth status
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);

    // Event untuk real-time validation (Login form)
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);

    // Event untuk real-time validation (Register form)
    on<NameChanged>(_onNameChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
  }

  // ==================== LOGIN ====================
  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    // Validasi form sebelum API call
    final emailError = _validateEmail(event.email);
    final passwordError = _validatePassword(event.password);

    if (emailError != null || passwordError != null) {
      emit(
        LoginFormState(
          email: event.email,
          password: event.password,
          emailError: emailError,
          passwordError: passwordError,
          isValid: false,
        ),
      );
      return;
    }

    emit(AuthLoading());

    try {
      // ========== BACKEND API CALL (COMMENTED) ==========
      /*
      final response = await http.post(
        Uri.parse('https://your-api.com/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': event.email,
          'password': event.password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = User(
          id: data['id'].toString(),
          name: data['name'],
          email: data['email'],
          token: data['token'],
        );

        // Simpan token ke shared_preferences
        // await _saveToken(user.token);

        emit(AuthSuccess(user));
      } else {
        final error = jsonDecode(response.body);
        emit(AuthFailure(error['message'] ?? 'Login gagal'));
      }
      */

      // ========== MOCK DATA (SEMENTARA) ==========
      await Future.delayed(const Duration(seconds: 1)); // Simulasi loading

      // Mock success login
      final user = User(
        id: '1',
        name: 'John Doe',
        email: event.email,
        token: 'mock_token_12345',
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure('Terjadi kesalahan: $e'));
    }
  }

  // ==================== REGISTER ====================
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    // Validasi form
    final nameError = _validateName(event.name);
    final emailError = _validateEmail(event.email);
    final passwordError = _validatePassword(event.password);
    final confirmPasswordError = _validateConfirmPassword(
      event.password,
      event.confirmPassword,
    );

    if (nameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      emit(
        RegisterFormState(
          name: event.name,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          nameError: nameError,
          emailError: emailError,
          passwordError: passwordError,
          confirmPasswordError: confirmPasswordError,
          isValid: false,
        ),
      );
      return;
    }

    emit(AuthLoading());

    try {
      // ========== BACKEND API CALL (COMMENTED) ==========
      /*
      final response = await http.post(
        Uri.parse('https://your-api.com/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'password_confirmation': event.confirmPassword,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final user = User(
          id: data['id'].toString(),
          name: data['name'],
          email: data['email'],
          token: data['token'],
        );

        // await _saveToken(user.token);
        emit(AuthSuccess(user));
      } else {
        final error = jsonDecode(response.body);
        emit(AuthFailure(error['message'] ?? 'Register gagal'));
      }
      */

      // ========== MOCK DATA (SEMENTARA) ==========
      await Future.delayed(const Duration(seconds: 1));

      final user = User(
        id: '1',
        name: event.name,
        email: event.email,
        token: 'mock_token_12345',
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure('Terjadi kesalahan: $e'));
    }
  }

  // ==================== LOGOUT ====================
  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    // ========== BACKEND API CALL (COMMENTED) ==========
    /*
    try {
      await http.post(
        Uri.parse('https://your-api.com/api/logout'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      // Tetap logout meskipun API error
    }
    */

    // Hapus token lokal
    // await _removeToken();

    emit(AuthInitial());
  }

  // ==================== CHECK AUTH STATUS ====================
  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    // ========== CEK TOKEN DARI LOCAL STORAGE ==========
    /*
    final token = await _getToken();
    if (token != null) {
      // Validasi token ke backend
      final response = await http.get(
        Uri.parse('https://your-api.com/api/me'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = User(
          id: data['id'].toString(),
          name: data['name'],
          email: data['email'],
          token: token,
        );
        emit(AuthSuccess(user));
      } else {
        emit(AuthInitial());
      }
    } else {
      emit(AuthInitial());
    }
    */

    // Mock: langsung ke initial
    emit(AuthInitial());
  }

  // ==================== REAL-TIME VALIDATION (LOGIN) ====================
  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    if (state is LoginFormState) {
      final currentState = state as LoginFormState;
      final emailError = _validateEmail(event.email);
      final passwordError = currentState.passwordError;

      emit(
        currentState.copyWith(
          email: event.email,
          emailError: emailError,
          isValid: emailError == null && passwordError == null,
        ),
      );
    } else {
      emit(
        LoginFormState(
          email: event.email,
          emailError: _validateEmail(event.email),
        ),
      );
    }
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    if (state is LoginFormState) {
      final currentState = state as LoginFormState;
      final passwordError = _validatePassword(event.password);

      emit(
        currentState.copyWith(
          password: event.password,
          passwordError: passwordError,
          isValid: currentState.emailError == null && passwordError == null,
        ),
      );
    } else {
      emit(
        LoginFormState(
          password: event.password,
          passwordError: _validatePassword(event.password),
        ),
      );
    }
  }

  // ==================== REAL-TIME VALIDATION (REGISTER) ====================
  void _onNameChanged(NameChanged event, Emitter<AuthState> emit) {
    if (state is RegisterFormState) {
      final currentState = state as RegisterFormState;
      final nameError = _validateName(event.name);

      emit(
        currentState.copyWith(
          name: event.name,
          nameError: nameError,
          isValid: _isRegisterFormValid(
            nameError: nameError,
            emailError: currentState.emailError,
            passwordError: currentState.passwordError,
            confirmPasswordError: currentState.confirmPasswordError,
          ),
        ),
      );
    }
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    if (state is RegisterFormState) {
      final currentState = state as RegisterFormState;
      final confirmPasswordError = _validateConfirmPassword(
        currentState.password,
        event.confirmPassword,
      );

      emit(
        currentState.copyWith(
          confirmPassword: event.confirmPassword,
          confirmPasswordError: confirmPasswordError,
          isValid: _isRegisterFormValid(
            nameError: currentState.nameError,
            emailError: currentState.emailError,
            passwordError: currentState.passwordError,
            confirmPasswordError: confirmPasswordError,
          ),
        ),
      );
    }
  }

  // ==================== VALIDATION METHODS ====================
  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!email.contains('@') || !email.contains('.')) {
      return 'Format email tidak valid';
    }
    if (email.length > 100) {
      return 'Email maksimal 100 karakter';
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (password.length < 6) {
      return 'Password minimal 6 karakter';
    }
    if (password.length > 20) {
      return 'Password maksimal 20 karakter';
    }
    return null;
  }

  String? _validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (name.length < 3) {
      return 'Nama minimal 3 karakter';
    }
    if (name.length > 50) {
      return 'Nama maksimal 50 karakter';
    }
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    }
    if (password != confirmPassword) {
      return 'Password tidak cocok';
    }
    return null;
  }

  bool _isRegisterFormValid({
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return nameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }
}
