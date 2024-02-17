class SigninWithEmailAndPasswordFailure {
  final String message;

  const SigninWithEmailAndPasswordFailure(
      [this.message = 'An unknown error occurred']);

  factory SigninWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const SigninWithEmailAndPasswordFailure(
            'The email address is not valid.');
      case 'user-disabled':
        return const SigninWithEmailAndPasswordFailure(
            'This user account has been disabled.');
      case 'user-not-found':
        return const SigninWithEmailAndPasswordFailure(
            'There is no user corresponding to the given email address.');
      case 'wrong-password':
        return const SigninWithEmailAndPasswordFailure(
            'The password is incorrect.');
      default:
        return const SigninWithEmailAndPasswordFailure();
    }
  }
}
