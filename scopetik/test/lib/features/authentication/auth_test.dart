import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scopetik/features/authentication/auth_impl.dart';

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

final MockUser _mockUser = MockUser();
final MockUserCredential _mockUserCredential = MockUserCredential();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User?> authStateChanges() {
    return Stream.fromIterable([_mockUser]);
  }
}

void main() {
  late MockFirebaseAuth mockAuth;
  late AuthImpl sut;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    sut = AuthImpl(firebaseAuth: mockAuth);
  });

  group(
    'Testing Login class',
    () {
      test(
        "emit occurs",
        () async {
          expectLater(sut.user, emitsInOrder([_mockUser]));
        },
      );

      group(
        "Account creation",
        () {
          test(
            "Returns success",
            () async {
              when(
                () => mockAuth.createUserWithEmailAndPassword(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
              ).thenAnswer((_) async => _mockUserCredential);

              expect(
                await sut.createAccount(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
                "Success",
              );
            },
          );

          test(
            "Returns an exception",
            () async {
              when(
                () => mockAuth.createUserWithEmailAndPassword(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
              ).thenAnswer(
                (_) async =>
                    throw FirebaseAuthException(code: '400', message: "failed"),
              );
              expect(
                await sut.createAccount(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
                "failed",
              );
            },
          );
        },
      );

      group(
        'SignIn',
        () {
          test(
            "Successful sign in",
            () async {
              when(
                () => mockAuth.signInWithEmailAndPassword(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
              ).thenAnswer((_) async => _mockUserCredential);

              expect(
                await sut.signIn(
                    email: "mutale1808@gmail.com", password: "Julia1808"),
                "Success",
              );
            },
          );

          test(
            "Sign in Returns an exception",
            () async {
              when(
                () => mockAuth.signInWithEmailAndPassword(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
              ).thenAnswer(
                (_) async =>
                    throw FirebaseAuthException(code: '400', message: "failed"),
              );
              expect(
                await sut.signIn(
                  email: "mutale1808@gmail.com",
                  password: "Julia1808",
                ),
                "failed",
              );
            },
          );
        },
      );

      group(
        'Sign Out',
        () {
          test(
            "Successful sign out",
            () async {
              when(
                () => mockAuth.signOut(),
              ).thenAnswer((_) async => null);

              expect(
                await sut.signOut(),
                "Success",
              );

              verify(() => mockAuth.signOut());
            },
          );

          test(
            "Sign out Returns an exception",
            () async {
              when(
                () => mockAuth.signOut(),
              ).thenAnswer(
                (_) async =>
                    throw FirebaseAuthException(code: '400', message: "failed"),
              );
              expect(
                await sut.signOut(),
                "failed",
              );

              verify(() => mockAuth.signOut());
            },
          );
        },
      );
    },
  );
}
