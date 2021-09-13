import 'package:faith_breed/authentications/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DB/authentications.dart';
import 'authentications/register.dart';
import 'screens/become_an_ambassador.dart';
import 'screens/forget_password.dart';
import 'screens/hompage.dart';
import 'screens/onboarding.dart';
import 'screens/splash_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return MaterialApp(
              title: 'Faith Breed',
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: Container(
                    child: Center(
                      child: Text(
                        "Something Went Wrong!... Could not initialize connection.",
                      ),
                    ),
                  ),
                ),);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                // 2
                Provider<AuthenticationService>(
                  create: (_) => AuthenticationService(FirebaseAuth.instance),
                ),
                // 3
                StreamProvider(
                  create: (context) =>
                      context.read<AuthenticationService>().authStateChanges,
                  initialData: null,
                )
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                ),
                initialRoute: 'auth_wrapper',
                routes: {
                  'splashscreen': (context) => SplashScreen(),
                  'auth_wrapper': (context) => AuthenticationWrapper(),
                  'homepage': (context) => HomePage(),
                  'on_boarding': (context) => OnboardingScreen(),
                  'register_page': (context) => Register(),
                  'sign_in': (context) => SignIn(),
                  'become_an_ambassador': (context) => BecomeAnAmbassador(),
                  'forgot_password':(context)=> ForgotPassword(),
                },
              ),
            );
          } else {
            // Otherwise, show something whilst waiting for initialization to complete
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }
}
// checks if user already signed in or not
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User?>();
    if (firebaseuser != null) {
      return HomePage();
    }
    return SplashScreen();
  }
}
