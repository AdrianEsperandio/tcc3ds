import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/models/searchWidget.dart';
import 'package:tcc3ds/view/telaDetalhesLivro.dart';
import 'package:tcc3ds/view/telaHome.dart';

class TelaPesquisa extends StatefulWidget {
  const TelaPesquisa({Key? key}) : super(key: key);

  @override
  _TelaPesquisaState createState() => _TelaPesquisaState();
}

class _TelaPesquisaState extends State<TelaPesquisa> {
  List<BookData>? books;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = livrosTotal;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            padding: EdgeInsets.only(
              top: 28,
              bottom: 12,
            ),
            child: Text(
              "Pesquisar livro",
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
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books!.length,
                itemBuilder: (context, index) {
                  final book = books![index];

                  return buildBook(book, index);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Título ou Autor',
        onChanged: searchBook,
      );

  Widget buildBook(BookData book, index) => Container(
        width: 122.5,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(DetailLivro.routeName, arguments: {
              "idLivro": book.idLivro,
              "quantExemplares": book.quantExemplares,
              "capaLivro": book.capaLivro,
              "tituloLivro": book.tituloLivro,
              "autorLivro": book.autorLivro,
              "editoraLivro": book.editoraLivro,
              "descriLivro": book.descriLivro,
              "numPaginas": book.numPaginas,
              "situacaoLivro": book.situacaoLivro,
              "anoLivro": book.anoLivro,
            });
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: book.idLivro!,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          book.capaLivro!,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 275,
                        child: Text(
                          book.tituloLivro!,
                          style: GoogleFonts.staatliches(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 275,
                        child: Text(
                          book.descriLivro!,
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void searchBook(String query) {
    final books = livrosTotal.where((book) {
      final titleLower = book.tituloLivro!.toLowerCase();
      final authorLower = book.autorLivro!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}
