import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaMeuEndereco.dart';
import 'package:tcc3ds/view/telaMeusDados.dart';
import 'package:tcc3ds/view/telaHome.dart';

class TelaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PerfilTela();
  }
}

class PerfilTela extends StatefulWidget {
  @override
  _PerfilTelaState createState() => _PerfilTelaState();
}

class _PerfilTelaState extends State<PerfilTela> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

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
            "Meu Perfil",
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
      body: _body(),
    );
  }

  _body() {
    final nome = "Clayson Geraldo";
    final urlImage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvnR6p3dKTh_3Atmrdcow6JMoUKNN-bnvLCACZVhvJibQzHcLPRgJ5-ySPVchMXdGBp4&usqp=CAU";
    return ListView(
      children: <Widget>[
        perfil(urlImage, nome),
        botoesInferiores(),
      ],
    );
  }

  Container perfil(String urlImage, String nome) {
    var _downloadPercentage = 0.0;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          stops: [0.2, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        children: <Widget>[
          buildHeader(
            urlImage: urlImage,
            nome: nome,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Leitor Iniciante",
              style: GoogleFonts.carroisGothic(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 100, left: 100, bottom: 10),
            child: LinearProgressIndicator(
              minHeight: 12,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.black12,
              value: _downloadPercentage,
            ),
          ),
          Text(
            "Nível 1: 0 / 5.000 XP",
            style: GoogleFonts.carroisGothic(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String nome,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(urlImage),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    nome,
                    style: GoogleFonts.carroisGothic(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Container botoesInferiores() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      padding: EdgeInsets.all(36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.grey,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MeusDados()));
                    },
                  ),
                  Text(
                    "Meus Dados",
                    style: GoogleFonts.carroisGothic(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.house),
                    color: Colors.grey,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MeuEndereco()));
                    },
                  ),
                  Text(
                    "Endereços",
                    style: GoogleFonts.carroisGothic(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.book),
                    color: Colors.grey,
                    onPressed: () {},
                    iconSize: 30,
                  ),
                  Text(
                    "Meus livros",
                    style: GoogleFonts.carroisGothic(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
