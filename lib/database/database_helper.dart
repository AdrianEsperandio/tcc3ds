import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tcc3ds/models/userData.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/models/addressData.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();
  DatabaseHelper();
  Future<Database>? _database;

  static const tabelaUsuario =
      "CREATE TABLE IF NOT EXISTS ${UserData.tableUsuario}("
      "${UserData.colNomeUsuario} VARCHAR(20) NOT NULL,"
      "${UserData.colSobrenomeUsuario} VARCHAR(20) NOT NULL,"
      "${UserData.colCpfUsuario} INT(12) NOT NULL PRIMARY KEY,"
      "${UserData.colEmailUsuario} VARCHAR(40) NOT NULL,"
      "${UserData.colSenhaUsuario} VARCHAR(30) NOT NULL,"
      "${UserData.colTelefoneUsuario} VARCHAR(15) NOT NULL,"
      "${UserData.colDataNasc} DATE NOT NULL,"
      "${UserData.colFotoUsuario} LONG TEXT NOT NULL);";

  static const tabelaLivro =
      "CREATE TABLE IF NOT EXISTS ${BookData.tableLivros}("
      "${BookData.colIdLivro} INTEGER PRIMARY KEY NOT NULL,"
      "${BookData.colQuantExemplares} INT(4) NOT NULL,"
      "${BookData.colCapaLivro} LONGTEXT NOT NULL,"
      "${BookData.colTituloLivro} VARCHAR(25) NOT NULL,"
      "${BookData.colAutorLivro} VARCHAR(30) NOT NULL,"
      "${BookData.colEditoraLivro} VARCHAR(30) NOT NULL,"
      "${BookData.colDescriLivro} VARCHAR(500) NOT NULL,"
      "${BookData.colNumPaginas} INT(4) NOT NULL,"
      "${BookData.colSituacaoLivro} INTEGER,"
      "${BookData.colAnoLivro} INT(4) NOT NULL);";

  static const tabelaEndereco =
      "CREATE TABLE IF NOT EXISTS ${AddressData.tableEnderecos}("
      "${AddressData.colIdEndereco} INTEGER PRIMARY KEY NOT NULL,"
      "${AddressData.colRuaEndereco} VARCHAR(30) NOT NULL,"
      "${AddressData.colNumeroEndereco} INT(4) NOT NULL,"
      "${AddressData.colBairroEndereco} VARCHAR(30) NOT NULL,"
      "${AddressData.colCidadeEndereco} VARCHAR(30) NOT NULL,"
      "${AddressData.colCepEndereco} INT(9) NOT NULL,"
      "${AddressData.colComplementoEndereco} VARCHAR(200) NOT NULL,"
      "${AddressData.colEstadoEndereco} VARCHAR(2) NOT NULL);";

  //Inicializa o banco na main.dart
  databaseCall() async {
    WidgetsFlutterBinding.ensureInitialized();
    _database = openDatabase(
      join(await getDatabasesPath(), "bibliotech.db"),
      onCreate: (db, version) async {
        //cria a tabela de usuários
        await db.execute(tabelaUsuario);

        //cria a tabela de livros
        await db.execute(tabelaLivro);

        //cria a tabela de endereco
        await db.execute(tabelaEndereco);
      },
      version: 1,
    );
  }

  Future<Database?> get database async {
    return _database;
  }

  //Fecha o banco de dados
  Future close() async {
    final db = await instance.database;
    db!.close();
  }

  // ******************************* Início das operações dos usuários *******************************

  //Insere um usuário na tabela
  Future<int?> insertUsuario(UserData usuario) async {
    final db = await instance.database;
    return await db!.insert(
      UserData.tableUsuario,
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Atualiza as informações do usuário na tabela
  Future<void> updateUsuario(UserData usuario) async {
    final db = await instance.database;
    await db!.update(
      UserData.tableUsuario,
      usuario.toMap(),
      where: "colCpfUsuario = ?",
      whereArgs: [usuario.cpfUsuario],
    );
  }

  //Lê os usuários cadastrados
  Future<UserData?> getUsuario(String cpfUsuario) async {
    final db = await instance.database;

    List<Map<String, dynamic>> maps = await db!.query(UserData.tableUsuario,
        columns: [
          UserData.colNomeUsuario,
          UserData.colSobrenomeUsuario,
          UserData.colCpfUsuario,
          UserData.colEmailUsuario,
          UserData.colSenhaUsuario,
          UserData.colTelefoneUsuario,
          UserData.colDataNasc,
          UserData.colFotoUsuario
        ],
        where: "${UserData.colCpfUsuario} = ?",
        whereArgs: [cpfUsuario]);

    if (maps.length > 0) {
      return UserData.fromMap(maps.first);
    } else {
      return null;
    }
  }
/*
  //Seleciona só o nome cadastrado de acordo com o CPF
  Future<UserData?> getNome(
      String emailUsuario, String senhaUsuario, String nomeUsuario) async {
    final db = await instance.database;
    await db!.rawQuery(
      "SELECT ${UserData.colNomeUsuario} FROM ${UserData.tableUsuario} WHERE ${UserData.colEmailUsuario} = '$emailUsuario' AND ${UserData.colSenhaUsuario} = '$senhaUsuario'",
    );
  }*/

  //Valida o login
  Future<UserData?> getLogin(String emailUsuario, String senhaUsuario) async {
    final db = await instance.database;
    var res = await db!.rawQuery(
      "SELECT ${UserData.colNomeUsuario} FROM ${UserData.tableUsuario} WHERE ${UserData.colEmailUsuario} = '$emailUsuario' AND ${UserData.colSenhaUsuario} = '$senhaUsuario'",
    );
    //print(res);
    if (res.length > 0) {
      return new UserData.fromMap(res.first);
    }
    Fluttertoast.showToast(
      msg: "Email ou senha inválidos!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
    );
    return null;
  }

  //Deleta o usuário da tabela
  Future<void> deleteUsuario(UserData usuario, int cpfUsuario) async {
    final db = await instance.database;
    await db!.delete(
      UserData.tableUsuario,
      where: "colCpfUsuario = ?",
      whereArgs: [usuario.cpfUsuario],
    );
  }

  // ******************************* Fim das operações dos usuários *******************************
  // ******************************* Início das operações dos livros ******************************

  //Insere um livro na tabela
  Future<int?> insertLivro(BookData livro) async {
    final db = await instance.database;
    return await db!.insert(
      BookData.tableLivros,
      livro.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Atualiza as informações do livro na tabela
  Future<void> updateLivro(BookData livro) async {
    final db = await instance.database;
    await db!.update(
      BookData.tableLivros,
      livro.toMap(),
      where: "colIdLivro = ?",
      whereArgs: [livro.idLivro],
    );
  }

  //Deleta o livro da tabela
  Future<void> deleteLivro(BookData livro, int idLivro) async {
    final db = await instance.database;
    await db!.delete(
      BookData.tableLivros,
      where: "colIdLivro = ?",
      whereArgs: [livro.idLivro],
    );
  }

  // ******************************* Fim das operações dos livros *********************************
  // ******************************* Início das operações dos endereços ***************************

  //Insere um endereço na tabela
  Future<int?> insertEndereco(AddressData endereco) async {
    final db = await instance.database;
    return await db!.insert(
      AddressData.tableEnderecos,
      endereco.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Atualiza as informações do endereço na tabela
  Future<void> updateEndereco(AddressData endereco) async {
    final db = await instance.database;
    await db!.update(
      AddressData.tableEnderecos,
      endereco.toMap(),
      where: "colIdEndereco = ?",
      whereArgs: [endereco.idEndereco],
    );
  }

  //Deleta o endereço da tabela
  Future<void> deleteEndereco(AddressData endereco, int idEndereco) async {
    final db = await instance.database;
    await db!.delete(
      AddressData.tableEnderecos,
      where: "colIdEndereco = ?",
      whereArgs: [endereco.idEndereco],
    );
  }
  // ******************************* Fim das operações dos endereços ******************************
}
