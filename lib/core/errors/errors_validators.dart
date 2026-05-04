class ValidationErrors {
  // Email errors
  static const String emailEmpty = 'Email tidak boleh kosong';
  static const String emailInvalid = 'Format email tidak valid';
  static const String emailTooLong = 'Email maksimal 100 karakter';
  static const String emailAlreadyExists = 'Email sudah terdaftar';

  // Password errors
  static const String passwordEmpty = 'Password tidak boleh kosong';
  static const String passwordTooShort = 'Password minimal 6 karakter';
  static const String passwordTooLong = 'Password maksimal 20 karakter';
  static const String passwordNoNumber = 'Password harus mengandung angka';
  static const String passwordNoUppercase = 'Password harus mengandung huruf besar';
  static const String passwordNoLowercase = 'Password harus mengandung huruf kecil';
  static const String passwordWeak = 'Password terlalu lemah';

  // Confirm password
  static const String confirmPasswordNotMatch = 'Konfirmasi password tidak cocok';

  // Name errors
  static const String nameEmpty = 'Nama tidak boleh kosong';
  static const String nameTooShort = 'Nama minimal 3 karakter';
  static const String nameTooLong = 'Nama maksimal 50 karakter';
  static const String nameInvalid = 'Nama hanya boleh berisi huruf dan spasi';

  // Phone errors
  static const String phoneEmpty = 'No. HP tidak boleh kosong';
  static const String phoneInvalid = 'No. HP tidak valid (contoh: 08123456789)';

  // Common errors
  static const String required = 'Field ini wajib diisi';
  static const String minLength = 'Minimal @length karakter';
  static const String maxLength = 'Maksimal @length karakter';
}