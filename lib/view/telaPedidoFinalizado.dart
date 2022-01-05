import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaHome.dart';

class PedidoFinalizado extends StatelessWidget {
  const PedidoFinalizado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FinalizadoPedido();
  }
}

bool animLogo = false;

class FinalizadoPedido extends StatefulWidget {
  const FinalizadoPedido({Key? key}) : super(key: key);

  @override
  _FinalizadoPedidoState createState() => _FinalizadoPedidoState();
}

class _FinalizadoPedidoState extends State<FinalizadoPedido> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        body: _body(context),
      ),
    );
  }
}

_body(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.blue],
        begin: FractionalOffset.topRight,
        end: FractionalOffset.bottomLeft,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: (!animLogo) ? 0 : 1,
            duration: Duration(seconds: 2),
            child: Image.asset(
              'assets/pedidoImagem.png',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          textPedido(),
          SizedBox(
            height: 20,
          ),
          botaoEntendi(context),
        ],
      ),
    ),
  );
}

textPedido() {
  return Text(
    "Seu pedido já está a caminho!",
    style: GoogleFonts.carroisGothic(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
  );
}

botaoEntendi(BuildContext context) {
  return ElevatedButton(
    child: Text(
      "Ok, entendi!",
      style: GoogleFonts.ubuntu(
        fontSize: 19,
      ),
    ),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => TelaHome()));
    },
  );
}
