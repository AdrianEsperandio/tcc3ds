import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaEditarEndereco.dart';
import 'package:tcc3ds/view/telaPerfil.dart';

class MeuEndereco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaEndereco();
  }
}

class TelaEndereco extends StatefulWidget {
  const TelaEndereco({Key? key}) : super(key: key);
  @override
  _TelaEnderecoState createState() => _TelaEnderecoState();
}

final padding = EdgeInsets.symmetric(horizontal: 20);

class _TelaEnderecoState extends State<TelaEndereco> {
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
            "Endereços",
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
            left: 48,
            right: 48,
            top: 25,
          ),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  rua(),
                  Expanded(child: ruaText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  numeroCasa(),
                  Expanded(child: numeroCasaText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  bairro(),
                  Expanded(child: bairroText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  cidade(),
                  Expanded(child: cidadeText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  cep(),
                  Expanded(child: cepText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  complemento(),
                  Expanded(child: complementoText()),
                  SizedBox(height: 50),
                ],
              ),
              Row(
                children: <Widget>[
                  estado(),
                  Expanded(child: estadoText()),
                  SizedBox(height: 50),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditarEndereco()));
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

  Text estado() {
    return Text(
      "Estado: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text estadoText() {
    return Text(
      "São Paulo",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text cidade() {
    return Text(
      "Município: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text cidadeText() {
    return Text(
      "Três Lagoas",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text cep() {
    return Text(
      "CEP: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text cepText() {
    return Text(
      "79630-033",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text bairro() {
    return Text(
      "Bairro: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text bairroText() {
    return Text(
      "Jardim das Oliveiras",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text complemento() {
    return Text(
      "Complemento: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text complementoText() {
    return Text(
      "Apartamento",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text rua() {
    return Text(
      "Rua: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text ruaText() {
    return Text(
      "Rua das Marias",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }

  Text numeroCasa() {
    return Text(
      "Nº: ",
      style: GoogleFonts.carroisGothic(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text numeroCasaText() {
    return Text(
      "546",
      style: GoogleFonts.carroisGothic(fontSize: 19),
    );
  }
}
