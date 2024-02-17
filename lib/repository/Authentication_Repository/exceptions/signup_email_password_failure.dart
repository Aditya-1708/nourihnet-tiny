class SignupWithEmailAndPasswordFailure {
  final String message;

  const SignupWithEmailAndPasswordFailure(
      [this.message = 'An unknown error occured']);
  factory SignupWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupWithEmailAndPasswordFailure(
            'please enter a stronger password');
      case 'invalid-email':
        return const SignupWithEmailAndPasswordFailure(
            'Email is not valid or bad email');
      case 'email-already-in-use':
        return const SignupWithEmailAndPasswordFailure(
            'Enter a different email');
      case 'operation-not-allowed':
        return const SignupWithEmailAndPasswordFailure(
            'Operation is Not allowed . Pleae contact suppourt');
      case 'user-disabled':
        return const SignupWithEmailAndPasswordFailure(
            'This user has been disabled, Please contact suppourt for help');
      default:
        return const SignupWithEmailAndPasswordFailure();
    }
  }
}
