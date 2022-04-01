//code snippet for writing a boilerplate t_scaffold
// code snippet for arrange, act and assert test aaaTest

// import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scopetik/features/login/models/user_model.dart';

//mocks the dependency class we nee to use in order to run the class we originally
//want to test and the implements the dependency's interface.

void main() {
  //Declare the class  to be tested as (system under test) sut and other dependencies
  // and variables needed.
  late UserModel sut;

  //in the setup initialize the declared sut and dependencies
  setUp(
    () {
      sut = UserModel(
        email: '',
        expiresIn: '',
        idToken: '',
        localId: '',
        refreshToken: '',
        registered: false,
        displayName: '',
      );
    },
  );

  group(
    'User Model test cases:',
    () {
      test(
        'Initial values are correct',
        () {
          //Check if variables in class are what they are supposed to be when instantiated.
          expect(sut.email, '');
          expect(sut.expiresIn, '');
          expect(sut.idToken, '');
          expect(sut.refreshToken, '');
          expect(sut.registered, false);
        },
      );

      test(
        "from JSON to UserModel object success",
        () async {
          //arrange
          final Map<String, dynamic> json = {
            "kind": "identitytoolkit#VerifyPasswordResponse",
            "localId": "rkiUgT7DH8N9BGrda7eqm2j3dmn2",
            "email": "mutale1808@gmail.com",
            "displayName": "",
            "idToken":
                "eyJhbGciOiJSUzI1NiIsImtpZCI6IjQ2NDExN2FjMzk2YmM3MWM4YzU5ZmI1MTlmMDEzZTJiNWJiNmM2ZTEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc2NvcGV0aWstY29tIiwiYXVkIjoic2NvcGV0aWstY29tIiwiYXV0aF90aW1lIjoxNjQ4ODA3NTQxLCJ1c2VyX2lkIjoicmtpVWdUN0RIOE45QkdyZGE3ZXFtMmozZG1uMiIsInN1YiI6InJraVVnVDdESDhOOUJHcmRhN2VxbTJqM2RtbjIiLCJpYXQiOjE2NDg4MDc1NDEsImV4cCI6MTY0ODgxMTE0MSwiZW1haWwiOiJtdXRhbGUxODA4QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJtdXRhbGUxODA4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.KZqMpWLsI77CyVnngb4hokYqIKZGqAoPWC8iA-LrQxYXGJsr7Z05hYEzxDqwAksVJm4L6GEXaba_Y_Xz3SFSLcC9kl4KV03uYuYupi4MmCHaFoK6cbNkWbIfo17CsHNq2dNv2O-ttJswqe24uFj5bBH8OWFv-3MptUM5ZmQtN8xrtFJNGjQLR78eCLU10h218wWQZ-5stKe6ELpbmEHMMie5e4bwNkocQACa4K_2cY3SHyhuGU6ur2om3BbdP8GKIgzO-anoOppQOdE0xVmFvcWYGA3dLvKHEo62TsTJcFr26aQ6hHG_Is-4XKuoJR_zRPJmZ6hCW2W6R57DF7_TwQ",
            "registered": true,
            "refreshToken":
                "AIwUaOkiBP-DvmLK1qsgbEPVJ8pHCN-Scf_yLeIivjNAxdeRWRJkYDsuvm_qdmYcZkg312J3nxl2MiPP3zsDDNXs2OXXH-3JXyaD_77wDFUgdF8Ns1RP4IN0oHgueANANTVU9f2Z3yzqm5XY8jIiw0bjNPVCHnfzddySWx7GoVr9dy2edefwc0XrGUEnyWICPNRi6enWdNRNECCPcNAvwjmb78DmWlRAUA",
            "expiresIn": "3600"
          };

          final UserModel matcher = UserModel(
            idToken:
                "eyJhbGciOiJSUzI1NiIsImtpZCI6IjQ2NDExN2FjMzk2YmM3MWM4YzU5ZmI1MTlmMDEzZTJiNWJiNmM2ZTEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc2NvcGV0aWstY29tIiwiYXVkIjoic2NvcGV0aWstY29tIiwiYXV0aF90aW1lIjoxNjQ4ODA3NTQxLCJ1c2VyX2lkIjoicmtpVWdUN0RIOE45QkdyZGE3ZXFtMmozZG1uMiIsInN1YiI6InJraVVnVDdESDhOOUJHcmRhN2VxbTJqM2RtbjIiLCJpYXQiOjE2NDg4MDc1NDEsImV4cCI6MTY0ODgxMTE0MSwiZW1haWwiOiJtdXRhbGUxODA4QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJtdXRhbGUxODA4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.KZqMpWLsI77CyVnngb4hokYqIKZGqAoPWC8iA-LrQxYXGJsr7Z05hYEzxDqwAksVJm4L6GEXaba_Y_Xz3SFSLcC9kl4KV03uYuYupi4MmCHaFoK6cbNkWbIfo17CsHNq2dNv2O-ttJswqe24uFj5bBH8OWFv-3MptUM5ZmQtN8xrtFJNGjQLR78eCLU10h218wWQZ-5stKe6ELpbmEHMMie5e4bwNkocQACa4K_2cY3SHyhuGU6ur2om3BbdP8GKIgzO-anoOppQOdE0xVmFvcWYGA3dLvKHEo62TsTJcFr26aQ6hHG_Is-4XKuoJR_zRPJmZ6hCW2W6R57DF7_TwQ",
            email: "mutale1808@gmail.com",
            expiresIn: "3600",
            localId: "rkiUgT7DH8N9BGrda7eqm2j3dmn2",
            refreshToken:
                "AIwUaOkiBP-DvmLK1qsgbEPVJ8pHCN-Scf_yLeIivjNAxdeRWRJkYDsuvm_qdmYcZkg312J3nxl2MiPP3zsDDNXs2OXXH-3JXyaD_77wDFUgdF8Ns1RP4IN0oHgueANANTVU9f2Z3yzqm5XY8jIiw0bjNPVCHnfzddySWx7GoVr9dy2edefwc0XrGUEnyWICPNRi6enWdNRNECCPcNAvwjmb78DmWlRAUA",
            registered: true,
            displayName: "",
          );
          //act
          sut = UserModel.fromJson(json);
          //assert
          expect(sut.displayName, matcher.displayName);
          expect(sut.email, matcher.email);
          expect(sut.expiresIn, matcher.expiresIn);
          expect(sut.idToken, matcher.idToken);
          expect(sut.localId, matcher.localId);
          expect(sut.refreshToken, matcher.refreshToken);
          expect(sut.registered, matcher.registered);

          //verify that the func was called
          //verify(() => MockClass.func()).called(1);
        },
      );
    },
  );
}
