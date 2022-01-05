import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/view/telaConfiguracoes.dart';

class AdicionarLivro extends StatelessWidget {
  const AdicionarLivro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LivroAdicionar();
  }
}

class LivroAdicionar extends StatefulWidget {
  const LivroAdicionar({Key? key}) : super(key: key);

  @override
  _LivroAdicionarState createState() => _LivroAdicionarState();
}

TextEditingController controllerCapa = TextEditingController();
TextEditingController controllerTitulo = TextEditingController();
TextEditingController controllerAutor = TextEditingController();
TextEditingController controllerEditora = TextEditingController();
TextEditingController controllerNumPag = TextEditingController();
TextEditingController controllerAnoPublicacao = TextEditingController();
TextEditingController controllerQuant = TextEditingController();
//TextEditingController controllerSituacao = TextEditingController();
TextEditingController controllerDesc = TextEditingController();
DatabaseHelper db = DatabaseHelper();

class _LivroAdicionarState extends State<LivroAdicionar> {
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
            "Adicionar Livro",
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
                    builder: (BuildContext context) => TelaConfig()));
          },
        ),
      ),
      body: _body(context),
    );
  }
}

_body(BuildContext context) {
  return Scaffold(
    body: ListView(
        padding: EdgeInsets.only(right: 48, left: 48, top: 24),
        children: <Widget>[
          labelCapa(),
          labelTitulo(),
          labelAutor(),
          labelEditora(),
          labelPaginas(),
          labelAnoPublicacao(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                labelQuantExemplares(),
                //labelSituacao(),
              ]),
          labelDescricao(),
          botaoAdicionar(context),
        ]),
  );
}

Container labelCapa() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerCapa,
      decoration: InputDecoration(
        labelText: "Capa",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Container labelTitulo() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerTitulo,
      decoration: InputDecoration(
        labelText: "Título",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Container labelAutor() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerAutor,
      decoration: InputDecoration(
        labelText: "Autor",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Container labelEditora() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, top: 3),
    child: TextField(
      controller: controllerEditora,
      decoration: InputDecoration(
        labelText: "Editora",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}

Container labelPaginas() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerNumPag,
      decoration: InputDecoration(
        labelText: "Número de páginas",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

Container labelAnoPublicacao() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerAnoPublicacao,
      decoration: InputDecoration(
        labelText: "Ano de publicação",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

Container labelQuantExemplares() {
  return Container(
    width: 100,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerQuant,
      decoration: InputDecoration(
        labelText: "Quantidade",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

/*Container labelSituacao() {
  return Container(
    width: 200,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: controllerSituacao,
      decoration: InputDecoration(
        labelText: "Situação",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}*/

Container labelDescricao() {
  return Container(
    //width: 320,
    //height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, top: 3),
    child: TextField(
      controller: controllerDesc,
      decoration: InputDecoration(
        labelText: "Descrição",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 1,
    ),
  );
}

Container botaoAdicionar(BuildContext context) {
  return Container(
    width: 310,
    height: 100,
    padding: EdgeInsets.only(left: 48, right: 48, top: 32, bottom: 32),
    child: ElevatedButton(
      onPressed: () async {
        final livroAdicionar = new BookData(
            idLivro: null,
            quantExemplares: controllerQuant.toString(),
            capaLivro: controllerCapa.toString(),
            tituloLivro: controllerTitulo.toString(),
            autorLivro: controllerAutor.toString(),
            editoraLivro: controllerEditora.toString(),
            descriLivro: controllerDesc.toString(),
            numPaginas: controllerNumPag.toString(),
            situacaoLivro: true,
            anoLivro: controllerAnoPublicacao.toString());

        int? inserirLivro = await db.insertLivro(livroAdicionar);
        print(inserirLivro);
        print("MARCELO PRÉDIOS");
      },
      child: Text(
        "Adicionar",
        style: GoogleFonts.ubuntu(
          fontSize: 19,
        ),
      ),
    ),
  );
}
