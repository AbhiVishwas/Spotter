import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SpotterFirebaseUser {
  SpotterFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SpotterFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SpotterFirebaseUser> spotterFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<SpotterFirebaseUser>(
        (user) => currentUser = SpotterFirebaseUser(user));
