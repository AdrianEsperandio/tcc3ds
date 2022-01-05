import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/view/telaDetalhesLivro.dart';

class ShowBook extends StatelessWidget {
  final int index;
  ShowBook(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.5,
      margin: EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(DetailLivro.routeName, arguments: {
            "idLivro": livrosHome[index].idLivro,
            "quantExemplares": livrosHome[index].quantExemplares,
            "capaLivro": livrosHome[index].capaLivro,
            "tituloLivro": livrosHome[index].tituloLivro,
            "autorLivro": livrosHome[index].autorLivro,
            "editoraLivro": livrosHome[index].editoraLivro,
            "descriLivro": livrosHome[index].descriLivro,
            "numPaginas": livrosHome[index].numPaginas,
            "situacaoLivro": livrosHome[index].situacaoLivro,
            "anoLivro": livrosHome[index].anoLivro,
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 12,
              child: Container(
                width: 121.66,
                height: 180.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(livrosHome[index].capaLivro!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Text(
                livrosHome[index].tituloLivro!,
                style: GoogleFonts.cabinCondensed(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
