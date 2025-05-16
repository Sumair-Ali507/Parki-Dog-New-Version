import 'package:parki_dog/features/auth/export/auth_export.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  // LoginCubit() : super(LoginInitial());
  LoginCubit(this.loginUseCase) : super(const LoginState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  login(BuildContext context,
      {bool isGoogleSignIn = false, bool isFacebookLogin = false}) async {
    if (isGoogleSignIn) {
      try {
        // Step 1: Trigger Google sign-in flow
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          // The user canceled the sign-in
          return;
        }

        // Step 2: Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Step 3: Create a new credential using token
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Step 4: Sign in with the credential
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Step 5: If sign-in succeeds, navigate to the next screen
        if (userCredential.user != null) {
          if (context.mounted) {
            context.pushNamedAndRemoveUntil(Routes.bottomNavigationBarRoute,
                predicate: (route) => false);
          }
        }
      } catch (e) {
        // print(e);
        // Handle sign-in error here
      }
    } else if (isFacebookLogin) {
      await _loginWithFacebook(context);
    } else if (formKey.currentState!.validate()) {
      emit(state.copyWith(status: LoginStatus1.loading));
      final result = await loginUseCase(LoginParameters(
          email: emailController.text, password: passwordController.text));
      if (result.$1 != null) {
        emit(state.copyWith(
            status: LoginStatus1.error, error: result.$1!.message.tr()));
      } else {
        await getIt
            .get<AppPreferences>()
            .setSecuredString(userToken, result.$2!.token ?? '');
        await getIt
            .get<AppPreferences>()
            .setCurrentUser(result.$2!.data?.id ?? '');
        emit(
            state.copyWith(status: LoginStatus1.success, response: result.$2!));
        if (context.mounted) {
          context.pushNamedAndRemoveUntil(Routes.bottomNavigationBarRoute,
              predicate: (route) => false);
        }
      }
    }
  }

  Future<void> _loginWithFacebook(BuildContext context) async {
    try {
      // Trigger Facebook Login
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Access Token if needed
        // final AccessToken accessToken = result.accessToken!;

        // You can now navigate to the next screen
        if (context.mounted) {
          context.pushNamedAndRemoveUntil(Routes.bottomNavigationBarRoute,
              predicate: (route) => false);
        }
      } else {
        // Handle error
        // print(result.message);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Facebook login failed: ${result.message}")),
          );
        }
      }
    } catch (e) {
      // Handle Exception
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("An error occurred during Facebook login")),
        );
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
