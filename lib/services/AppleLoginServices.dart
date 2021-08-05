import 'dart:convert';
import 'dart:io';
import 'dart:math';

//TODO: to use apple login, just add below packages to pubspec and uncomment below code

// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class AppleLoginServices {
//   static Future<AuthCredential> loginWithApple() async {
//     if (Platform.isIOS) {
//       if (await SignInWithApple.isAvailable()) {
//         // To prevent replay attacks with the credential returned from Apple, we
//         // include a nonce in the credential request. When signing in in with
//         // Firebase, the nonce in the id token returned by Apple, is expected to
//         // match the sha256 hash of `rawNonce`.
//         final _rawNonce = _generateNonce();
//         final _nonce = _sha256ofString(_rawNonce);
//         try {
//           // Request credential for the currently signed in Apple account.
//           final appleCredential = await SignInWithApple.getAppleIDCredential(
//             scopes: [
//               AppleIDAuthorizationScopes.email,
//               AppleIDAuthorizationScopes.fullName,
//             ],
//             // webAuthenticationOptions: WebAuthenticationOptions(
//             //   clientId: "boozli",
//             //   redirectUri: Uri.parse(
//             //     'https://com.myapp.firebaseapp.com/__/auth/handler',
//             //   ),
//             // ),
//             nonce: _nonce,
//           );

//           print(appleCredential.authorizationCode);

//           // Create an `OAuthCredential` from the credential returned by Apple.
//           AuthCredential oauthCredential =
//               OAuthProvider("apple.com").credential(
//             idToken: appleCredential.identityToken,
//             rawNonce: _rawNonce,
//           );

//           // Sign in the user with Firebase. If the nonce we generated earlier does
//           // not match the nonce in `appleCredential.identityToken`, sign in will fail.

//           // as we generated credential here, we will return back according to our requirement so that
//           // user can login with firebase
//           return oauthCredential;
//         } catch (exception) {
//           print("Error in apple sign in : " + exception.toString());
//           throw exception;
//         }
//       } else {
//         print("ERROR");
//         throw "Apple Signin is not available";
//       }
//     } else {
//       throw "Apple Signin is not available for your device";
//     }
//   }

//   /// Generates a cryptographically secure random nonce, to be included in a
//   /// credential request.
//   static String _generateNonce([int length = 32]) {
//     final _charset =
//         '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final _random = Random.secure();
//     return List.generate(
//         length, (_) => _charset[_random.nextInt(_charset.length)]).join();
//   }

//   /// Returns the sha256 hash of [input] in hex notation.
//   static String _sha256ofString(String input) {
//     final _bytes = utf8.encode(input);
//     final _digest = sha256.convert(_bytes);
//     return _digest.toString();
//   }
// }
