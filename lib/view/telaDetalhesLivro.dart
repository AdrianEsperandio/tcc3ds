import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/services/mochilaProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tcc3ds/view/telaMochila.dart';
import 'package:tcc3ds/view/telaPesquisa.dart';

class DetailLivro extends StatefulWidget {
  static const routeName = "/detail-livro";

  final routeArgs;

  DetailLivro(routeArgs) : this.routeArgs = routeArgs;

  @override
  _DetailLivroState createState() => _DetailLivroState();
}

class _DetailLivroState extends State<DetailLivro> {
  BookData? livro;
  @override
  void initState() {
    livro = BookData(
      idLivro: widget.routeArgs['idLivro'],
      quantExemplares: widget.routeArgs['quantExemplares'],
      capaLivro: widget.routeArgs["capaLivro"],
      tituloLivro: widget.routeArgs['tituloLivro'],
      autorLivro: widget.routeArgs['autorLivro'],
      editoraLivro: widget.routeArgs['editoraLivro'],
      descriLivro: widget.routeArgs['descriLivro'],
      numPaginas: widget.routeArgs['numPaginas'],
      situacaoLivro: widget.routeArgs['situacaoLivro'],
      anoLivro: widget.routeArgs['anoLivro'],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(
            top: 28,
            bottom: 12,
          ),
          child: Text(
            "Detalhes do livro",
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TelaPesquisa()));
          },
        ),
        actions: <Widget>[
          Center(
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.backpack, size: 30),
                    onPressed: () {
                      //  if (_listaMochila.isNotEmpty)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TelaMochila()));
                    },
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(left: 26, top: 30),
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        "${MochilaProvider.length}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Container(
                  height: 240,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        livro!.capaLivro!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              livro!.tituloLivro!,
              style: GoogleFonts.staatliches(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              livro!.autorLivro!,
              style: GoogleFonts.staatliches(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                          width: 70,
                        ),
                        Icon(
                          Icons.list,
                          size: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          livro!.numPaginas.toString() + " páginas",
                          style: GoogleFonts.jaldi(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                          width: 70,
                        ),
                        Icon(
                          Icons.date_range,
                          size: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          livro!.anoLivro.toString(),
                          style: GoogleFonts.jaldi(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                          width: 70,
                        ),
                        Icon(
                          Icons.edit,
                          size: 45,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          livro!.editoraLivro!,
                          style: GoogleFonts.jaldi(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              livro!.descriLivro!,
              softWrap: true,
              style: GoogleFonts.openSans(
                fontSize: 20,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Adicionado a ler mais tarde",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey[800],
                );
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.watch_later),
                  Container(height: 5, width: 5),
                  Text(
                    "Ler mais tarde",
                    style: GoogleFonts.staatliches(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Adicionado à mochila",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.grey[800],
                );
                MochilaProvider.adicionarItem(livro!);
              },
              color: Colors.blue[900],
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.backpack),
                  Container(height: 5, width: 5),
                  Text(
                    "Adicionar à mochila",
                    style: GoogleFonts.staatliches(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
