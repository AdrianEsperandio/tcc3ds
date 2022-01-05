import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/view/telaDetalhesLivro.dart';

class LivrosMochila extends StatefulWidget {
  final BookData livro;
  final Function(int i) deletarLivro;
  LivrosMochila(this.livro, this.deletarLivro);

  @override
  _LivrosMochilaState createState() => _LivrosMochilaState();
}

class _LivrosMochilaState extends State<LivrosMochila> {
  late void Function(int i) deletaLivro;
  @override
  void initState() {
    deletaLivro = widget.deletarLivro;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.5,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(DetailLivro.routeName, arguments: {
            "idLivros": widget.livro.idLivro,
            "quantExemplares": widget.livro.quantExemplares,
            "capaLivro": widget.livro.capaLivro,
            "tituloLivro": widget.livro.tituloLivro,
            "autorLivro": widget.livro.autorLivro,
            "editoraLivro": widget.livro.editoraLivro,
            "descriLivro": widget.livro.descriLivro,
            "numPaginas": widget.livro.numPaginas,
            "situacaoLivro": widget.livro.situacaoLivro,
            "anoLivro": widget.livro.anoLivro,
          });
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: <Widget>[
              Hero(
                tag: widget.livro.idLivro!,
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
                        widget.livro.capaLivro!,
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
                      width: 260,
                      child: Text(
                        widget.livro.tituloLivro!,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.staatliches(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 240,
                      child: Text(
                        widget.livro.descriLivro!,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          height: 1.1,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 180,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              deletaLivro(widget.livro.idLivro!);
                            },
                            child: Text(
                              "Remover",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 20,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        ],
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
  }
}
