import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaAdicionarLivro.dart';
import 'package:tcc3ds/view/telaEditarDadosPessoais.dart';
import 'package:tcc3ds/view/telaEditarEndereco.dart';
import 'package:tcc3ds/view/telaHome.dart';

class ConfigTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaConfig();
  }
}

class TelaConfig extends StatefulWidget {
  const TelaConfig({Key? key}) : super(key: key);

  @override
  _TelaConfigState createState() => _TelaConfigState();
}

class _TelaConfigState extends State<TelaConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: EdgeInsets.only(
            top: 28,
            bottom: 12,
          ),
          child: Text(
            "Configurações",
            textAlign: TextAlign.center,
            style: GoogleFonts.jaldi(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TelaHome()));
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          alterarDadosPessoais(),
          alterarEndereco(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Ações do Administrador",
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          adicionarLivro(),
          editarLivro(),
          deletarLivro(),
        ],
      ),
    );
  }

  Card alterarDadosPessoais() {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text(
          "Alterar dados pessoais",
          style: GoogleFonts.carroisGothic(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => EditarDadosPessoais()));
        },
      ),
    );
  }

  Card alterarEndereco() {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        title: Text(
          "Alterar endereço",
          style: GoogleFonts.carroisGothic(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => EditarEndereco()));
        },
      ),
    );
  }

  Card adicionarLivro() {
    return Card(
      color: Colors.green[50],
      child: ListTile(
        leading: Icon(
          Icons.add,
          color: Colors.black,
        ),
        title: Text(
          "Adicionar Livro",
          style: GoogleFonts.carroisGothic(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AdicionarLivro()));
        },
      ),
    );
  }

  Card editarLivro() {
    return Card(
      color: Colors.green[50],
      child: ListTile(
        leading: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        title: Text(
          "Editar Livro",
          style: GoogleFonts.carroisGothic(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Card deletarLivro() {
    return Card(
      color: Colors.green[50],
      child: ListTile(
        leading: Icon(
          Icons.delete,
          color: Colors.black,
        ),
        title: Text(
          "Deletar Livro",
          style: GoogleFonts.carroisGothic(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
