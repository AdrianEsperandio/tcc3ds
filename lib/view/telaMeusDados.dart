import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaEditarDadosPessoais.dart';
import 'package:tcc3ds/view/telaPerfil.dart';

class MeusDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaDados();
  }
}

class TelaDados extends StatefulWidget {
  const TelaDados({Key? key}) : super(key: key);
  @override
  _TelaDadosState createState() => _TelaDadosState();
}

final padding = EdgeInsets.symmetric(horizontal: 20);

class _TelaDadosState extends State<TelaDados> {
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
            "Meus Dados",
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
                    builder: (BuildContext context) => TelaPerfil()));
          },
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: 64,
            right: 64,
          ),
          child: Column(
            children: [
              fotoPerfil(),
              Row(
                children: <Widget>[
                  nome(),
                  Expanded(child: nomeText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  cpf(),
                  cpfText(),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  email(),
                  Expanded(child: emailText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  telefone(),
                  telefoneText(),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  dataNasc(),
                  dataNascText(),
                  SizedBox(height: 50),
                ],
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              EditarDadosPessoais()));
                },
                child: Text(
                  "Editar",
                  style: GoogleFonts.ubuntu(
                    fontSize: 19,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget fotoPerfil({
    String urlImage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvnR6p3dKTh_3Atmrdcow6JMoUKNN-bnvLCACZVhvJibQzHcLPRgJ5-ySPVchMXdGBp4&usqp=CAU",
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(urlImage),
              ),
               Padding(
                padding: EdgeInsets.only(top: 4),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.camera_alt_sharp),
                ),
              ),
            ],
          ),
        ),
      );

  Text nome() {
    return Text(
      "Nome: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text nomeText() {
    return Text(
      "Clayson Geraldo",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text email() {
    return Text(
      "Email: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text emailText() {
    return Text(
      "claysonbr@gmail.com",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text telefone() {
    return Text(
      "Telefone: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text telefoneText() {
    return Text(
      "(16) 90781-5445",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text dataNasc() {
    return Text(
      "Data de Nascimento: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text dataNascText() {
    return Text(
      "15/01/1998",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text cpf() {
    return Text(
      "CPF: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text cpfText() {
    return Text(
      "112.491.220-74",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }
}
