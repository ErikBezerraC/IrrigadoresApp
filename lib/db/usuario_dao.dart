import 'package:irrigadorapp/db/db_helper.dart';
import 'package:irrigadorapp/domain/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao {
  Future<bool> login(String username, String password) async {
    Database db = await DBHelper().initDB();
    String sql = '''
        SELECT *
        FROM USER
        WHERE username = ? AND password = ?;
    ''';

    var result = await db.rawQuery(sql, [username, password]);
    return result.isNotEmpty;
  }

  save(User user) async {
    Database db = await DBHelper().initDB();
    db.insert('USER', user.toJson());
  }
}