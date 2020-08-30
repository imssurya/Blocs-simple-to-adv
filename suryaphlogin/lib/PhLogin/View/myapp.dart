import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suryaphlogin/PhLogin/View/home_page.dart';
import 'package:suryaphlogin/PhLogin/View/login_page.dart';
import 'package:suryaphlogin/PhLogin/phlogin.dart';

class MyApp extends StatefulWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserRepository get userRepository => widget._userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitilized) {
            return SplashPage();
          } else if (state is UnAuthenticated) {
            // return LoginPage(
            //   userRepository: userRepository,
            // );
            return LoginScreen();
          } else if (state is Authenticated) {
            return Homepage();
          } else if (state is AuthenticatedButNotRegistered) {
            return EditUserDetail();
          } else {
            return SplashPage();
          }
        },
      ),
    );
  }
}
