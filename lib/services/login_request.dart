import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/models/userData.dart';

class LoginRequest {
  DatabaseHelper? con = new DatabaseHelper();
  Future<UserData?> getLogin(String? email, String? senha) async {
    var result = con!.getLogin(email!, senha!);
    return result;
  }
}
