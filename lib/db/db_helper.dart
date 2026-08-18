import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // await -> async e Future<TipoDeRetorno>
  Future<Database> initDB() async {
    // Onde salvar o Banco de Dados
    // C:/database/name
    String path = await getDatabasesPath();
    // Nome do banco
    String dbName = 'Irrigadores-3.db';

    // Path do Banco de Dados + Nome do Banco
    String dbPath = join(path, dbName);

    // Criar e/ou Abrir o Banco de Dados
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);

    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE PROPRIEDADE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            urlImagem TEXT
        );''';

    await db.execute(sql);

    sql = ''' 
        CREATE TABLE USER (
            username TEXT PRIMARY KEY,
            password TEXT
        );''';

    await db.execute(sql);

    sql = "INSERT INTO USER (username, password) VALUES ('jubis', '123');";
    await db.execute(sql);

  }
}