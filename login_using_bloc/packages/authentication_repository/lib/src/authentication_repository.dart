import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({String userName, String password}) async {
    assert(userName != null);
    assert(password != null);
    await Future.delayed(const Duration(milliseconds: 300), () {
      _controller.add(AuthenticationStatus.authenticated);
    });
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void disposs() {
    _controller.close();
  }
}
