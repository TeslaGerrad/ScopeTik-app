// import 'package:mockito/mockito.dart';

import 'package:scopetik/features/login/models/user_model.dart';
import 'package:test/test.dart';

//mocks the dependency class we nee to use in order to run the class we originally
//want to test and the implements the dependency's interface.

// class MockClass implements Class extends Mock {

// }

void main() {
  //Declare the class  to be tested as (system under test) sut and other dependencies
  // and variables needed.
  late UserModel sut;

  //in the setup initialize the declared sut and dependencies
  setUp(() {
    sut = UserModel(
      email: '',
      expiresln: '',
      idToken: '',
      localId: '',
      refreshToken: '',
      registered: false,
    );
  });

  test('successful from json derealization to UserModel object', () {
    expect(sut.email, '');
  });
}
