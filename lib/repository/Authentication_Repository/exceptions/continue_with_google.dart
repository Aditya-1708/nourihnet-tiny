class ContinueWithGoogleFailure {
  final String message;

  const ContinueWithGoogleFailure(
      [this.message = 'An unknown error occurred']);

  factory ContinueWithGoogleFailure.code(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const ContinueWithGoogleFailure(
            'An account already exists with the same email address but different sign-in credentials.');
      case 'invalid-credential':
        return const ContinueWithGoogleFailure(
            'The provided credential is malformed or has expired.');
      case 'operation-not-allowed':
        return const ContinueWithGoogleFailure(
            'Google sign-in is not enabled for this project.');
      case 'user-disabled':
        return const ContinueWithGoogleFailure(
            'This user account has been disabled.');
      case 'user-not-found':
        return const ContinueWithGoogleFailure(
            'There is no user corresponding to the given email address.');
      case 'wrong-password':
        return const ContinueWithGoogleFailure(
            'The password is incorrect.');
      default:
        return const ContinueWithGoogleFailure();
    }
  }
}
