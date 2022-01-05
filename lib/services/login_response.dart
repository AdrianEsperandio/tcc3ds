import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/models/userData.dart';
import 'package:tcc3ds/services/login_request.dart';

abstract class LoginCallBack {
  void onLoginSuccess(UserData? usuario);
  void onLoginError(String? error);
}

DatabaseHelper? db = DatabaseHelper();

class LoginResponse {
  LoginCallBack _callBack;
  LoginRequest loginRequest = new LoginRequest();
  LoginResponse(this._callBack);
  doLogin(String? email, String? senha) {
    loginRequest
        .getLogin(email, senha)
        .then((email) => _callBack.onLoginSuccess(email!))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  }
}
