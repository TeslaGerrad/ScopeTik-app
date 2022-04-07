import 'package:flutter_test/flutter_test.dart';
import 'package:scopetik/features/login/models/password.dart';

void main() {
  late Password sut;

  setUp(() {
    sut = const Password.pure();
  });

  group(
    "testing password validator",
    () {
      test(
        "returns empty",
        () async {
          expect(
            sut.validator(""),
            PasswordValidationError.empty,
          );
        },
      );

      test(
        "returns invalid password",
        () async {
          expect(
            sut.validator("value"),
            PasswordValidationError.invalidPassword,
          );
        },
      );
      test(
        "returns null",
        () async {
          expect(sut.validator("Jacob1808"), null);
        },
      );
    },
  );
}
