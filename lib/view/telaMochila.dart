import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/components/livrosMochila.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/services/mochilaProvider.dart';
import 'package:tcc3ds/view/telaFecharPedido.dart';
import 'package:tcc3ds/view/telaHome.dart';

class TelaMochila extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MochilaTela();
  }
}

class MochilaTela extends StatefulWidget {
  const MochilaTela({Key? key}) : super(key: key);

  @override
  _MochilaTelaState createState() => _MochilaTelaState();
}

class _MochilaTelaState extends State<MochilaTela> {
  Map<int, BookData> mapaLivros = MochilaProvider.mapaLivros;
  @override
  void initState() {
    mapaLivros = MochilaProvider.mapaLivros;

    super.initState();
  }

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
            "Sua Mochila",
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
      body: _body(),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15),
              ),
            ]),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Total de livros: ${MochilaProvider.length} ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        //side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (MochilaProvider.length > 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FecharPedido()));
                    }
                    if (MochilaProvider.length == 0) {
                      Fluttertoast.showToast(
                        msg: "Sua mochila está vazia!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.grey[800],
                      );
                    }
                  },
                  child: Text("Fechar Pedido",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        letterSpacing: 1.1,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  removerDaMochila(int i) {
    setState(() {
      MochilaProvider.deletarItem(i);
      mapaLivros = MochilaProvider.mapaLivros;
    });
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          if (mapaLivros.length > 0)
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: mapaLivros.length,
                itemBuilder: (ctx, i) => LivrosMochila(
                    mapaLivros.values.elementAt(i), removerDaMochila),
              ),
            ),
          if (mapaLivros.length == 0)
          SizedBox(height: 140,),
            Center(
              child: Text(
                "Sua mochila está vazia",
                style: GoogleFonts.bangers(
                  fontSize: 42,
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/emoji.png",
            height: 60,
          ),
        ],
      ),
    );
  }
}
