import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaMochila.dart';
import 'package:tcc3ds/view/telaPedidoFinalizado.dart';

class FecharPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PedidoFechar();
  }
}

class PedidoFechar extends StatefulWidget {
  const PedidoFechar({Key? key}) : super(key: key);

  @override
  _PedidoFecharState createState() => _PedidoFecharState();
}

class _PedidoFecharState extends State<PedidoFechar> {
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
            "Confirmar Pedido",
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
                    builder: (BuildContext context) => TelaMochila()));
          },
        ),
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return ListView(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(15),
        child: Text(
          "Seus livros na mochila:",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Column(
        children: <Widget>[
          Text(
            "Resident Evil 5 - Nêmesis",
            textAlign: TextAlign.center,
            style: GoogleFonts.carroisGothic(fontSize: 19),
          ),
          SizedBox(height: 12),
          Text(
            "O ladrão de raios (Percy Jackson e os Olimpianos)",
            textAlign: TextAlign.center,
            style: GoogleFonts.carroisGothic(fontSize: 19),
          ),
          SizedBox(height: 12),
        ],
      ),
      Container(
        padding: EdgeInsets.all(15),
        child: Text(
          "Seu endereço é:",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(
          right: 48,
          left: 48,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                rua(),
                Expanded(child: ruaText()),
                SizedBox(height: 25),
              ],
            ),
            Row(
              children: <Widget>[
                numeroCasa(),
                Expanded(child: numeroCasaText()),
                SizedBox(height: 25),
              ],
            ),
            Row(
              children: <Widget>[
                bairro(),
                Expanded(child: bairroText()),
                SizedBox(height: 25),
              ],
            ),
            Row(
              children: <Widget>[
                cidade(),
                Expanded(child: cidadeText()),
                SizedBox(height: 25),
              ],
            ),
            Row(
              children: <Widget>[
                cep(),
                Expanded(child: cepText()),
                SizedBox(height: 25),
              ],
            ),
            Row(
              children: <Widget>[
                complemento(),
                Expanded(child: complementoText()),
                SizedBox(height: 25),
              ],
            ),
            Row(
              children: <Widget>[
                estado(),
                Expanded(child: estadoText()),
                SizedBox(height: 25),
              ],
            ),
            SizedBox(height: 25),
            botaoFinalizar(context),
          ],
        ),
      )
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


activateAnimLogo() async {
  await Future.delayed(Duration(seconds: 1));
  animLogo = true;
}

botaoFinalizar(BuildContext context) {
  return Container(
      child: ElevatedButton(
    child: Text(
      "Finalizar",
      style: GoogleFonts.ubuntu(
        fontSize: 19,
      ),
    ),
    onPressed: () {
      activateAnimLogo();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PedidoFinalizado()));
    },
  ));
}
