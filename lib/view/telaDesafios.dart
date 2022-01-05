import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaDesafios extends StatelessWidget {
  const TelaDesafios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesafiosTela();
  }
}

class DesafiosTela extends StatefulWidget {
  const DesafiosTela({Key? key}) : super(key: key);

  @override
  _DesafiosTelaState createState() => _DesafiosTelaState();
}

class _DesafiosTelaState extends State<DesafiosTela> {
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
            "Desafios",
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
        centerTitle: true,
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
        children: [
          desafio1(),
          desafio2(),
          desafio3(),
        ],
      ),
    );
  }

  Card desafio1() {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 1000,
            child: Image.network(
              "https://live.staticflickr.com/5534/30699737846_442cb6e7aa_b.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          ListTile(
            title: Text(
              'O SAPO NÃO LAVA O PÉ?',
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Leia 5 livros em que o protagonista é um sapo',
              style: GoogleFonts.notoSans(fontSize: 16),
              maxLines: 4,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: Colors.purple,
                onPressed: () {},
                child: Text('Aceitar desafio',
                    style: GoogleFonts.questrial(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(width: 150),
              Container(
                child: Text(
                  "XP 1500",
                  style: GoogleFonts.inconsolata(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card desafio2() {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 1000,
            child: Image.network(
              "https://preview.redd.it/5b5km6w7bo951.png?width=529&format=png&auto=webp&s=cc92843968249649581b7693e43ee38d890c4c42",
              fit: BoxFit.fitWidth,
            ),
          ),
          ListTile(
            title: Text(
              'VIVENDO A VIDA MUITO DOIDO',
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Leia 25 livros em 2 dias',
              style: GoogleFonts.notoSans(fontSize: 16),
              maxLines: 4,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: Colors.purple,
                onPressed: () {},
                child: Text(
                  'Aceitar desafio',
                  style: GoogleFonts.questrial(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 150),
              Container(
                child: Text(
                  "XP 9000",
                  style: GoogleFonts.inconsolata(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card desafio3() {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 1000,
            child: Image.network(
              "https://i0.wp.com/jornal.usp.br/wp-content/uploads/20170223_00_revolucao_russa1.jpg?resize=800%2C420",
              fit: BoxFit.fitWidth,
            ),
          ),
          ListTile(
            title: Text(
              'O QUE FOI QUE ACONTECEU?',
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 4,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Leia 3 livros sobre revoluções históricas',
              style: GoogleFonts.notoSans(fontSize: 16),
              maxLines: 4,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: Colors.purple,
                onPressed: () {},
                child: Text(
                  'Aceitar desafio',
                  style: GoogleFonts.questrial(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 150),
              Container(
                child: Text(
                  "XP 2700",
                  style: GoogleFonts.inconsolata(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
