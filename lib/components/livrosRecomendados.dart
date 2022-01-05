import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/view/telaDetalhesLivro.dart';

class LivrosRecomendados extends StatelessWidget {
  final int index;
  LivrosRecomendados(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.5,
      margin: EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(DetailLivro.routeName, arguments: {
            "idLivro": livrosRecomendados[index].idLivro,
            "quantExemplares": livrosRecomendados[index].quantExemplares,
            "capaLivro": livrosRecomendados[index].capaLivro,
            "tituloLivro": livrosRecomendados[index].tituloLivro,
            "autorLivro": livrosRecomendados[index].autorLivro,
            "editoraLivro": livrosRecomendados[index].editoraLivro,
            "descriLivro": livrosRecomendados[index].descriLivro,
            "numPaginas": livrosRecomendados[index].numPaginas,
            "situacaoLivro": livrosRecomendados[index].situacaoLivro,
            "anoLivro": livrosRecomendados[index].anoLivro,
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
                    image: NetworkImage(livrosRecomendados[index].capaLivro!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
                child: Text(
              livrosRecomendados[index].tituloLivro!,
              style: GoogleFonts.cabinCondensed(
                fontSize: 18,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
