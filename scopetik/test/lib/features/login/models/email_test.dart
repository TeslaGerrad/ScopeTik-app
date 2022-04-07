import 'package:flutter_test/flutter_test.dart';
import 'package:scopetik/features/login/models/email.dart';

void main() {
  late Email sut;

  setUp(() {
    sut = const Email.pure();
  });

  group(
    "Testing email validation",
    () {
      test(
        "returns invalid email",
        () async {
          expect(sut.validator("jacob"), EmailValidationError.invalidEmail);
        },
      );
      test(
        "returns empty email",
        () async {
          expect(sut.validator(""), EmailValidationError.empty);
        },
      );
      test(
        "returns null",
        () async {
          expect(sut.validator("mutale1808@gmail.com"), null);
        },
      );
    },
  );
}
