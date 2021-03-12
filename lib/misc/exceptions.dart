class UsernameExistException implements Exception {
  @override
  String toString() => "Username already exists in database";
}

class NetworkIsNotAvailableException implements Exception {
  @override
  String toString() => "Network is not available";
}

class UnknownError implements Exception {
  @override
  String toString() => "Unknown error";
}

class PasswordsNotEqualsException implements Exception {
  @override
  String toString() => "Passwords is not the same";
}

class UserNotExistException implements Exception {
  @override
  String toString() => "User is not exist in database";
}