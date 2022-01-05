import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaMeuEndereco.dart';
import 'package:brasil_fields/brasil_fields.dart';

class EditarEndereco extends StatelessWidget {
  const EditarEndereco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnderecoEditar();
  }
}

class EnderecoEditar extends StatefulWidget {
  const EnderecoEditar({Key? key}) : super(key: key);

  @override
  _EnderecoEditarState createState() => _EnderecoEditarState();
}

String _estadoSelecionado = "AC";

class _EnderecoEditarState extends State<EnderecoEditar> {
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
            "Endereços",
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
                    builder: (BuildContext context) => MeuEndereco()));
          },
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.only(right: 48, left: 48, top: 24),
        child: Column(children: <Widget>[
          labelRua(),
          labelNumero(),
          labelBairro(),
          labelCidade(),
          labelCEP(),
          labelComplemento(),
          estado(),
          botaoConcluir(context),
        ]),
      ),
    ]);
  }

  Container labelRua() {
    return Container(
      width: 320,
      height: 60,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 3),
      child: TextField(
        controller: TextEditingController(text: "Rua das Marias"),
        decoration: InputDecoration(
          labelText: "Rua",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          hintText: "Jardim das Flores",
        ),
      ),
    );
  }

  Container labelNumero() {
    return Container(
      width: 320,
      height: 60,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 3),
      child: TextField(
        controller: TextEditingController(text: "546"),
        decoration: InputDecoration(
          labelText: "Número",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          hintText: "0000",
        ),
      ),
    );
  }

  Container labelBairro() {
    return Container(
      width: 320,
      height: 60,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 3),
      child: TextField(
        controller: TextEditingController(text: "Jardim das Oliveiras"),
        decoration: InputDecoration(
          labelText: "Bairro",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          hintText: "Jardim dos Anjos",
        ),
      ),
    );
  }

  Container labelCidade() {
    return Container(
      width: 320,
      height: 60,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 3),
      child: TextField(
        controller: TextEditingController(text: "Três Lagoas"),
        decoration: InputDecoration(
          labelText: "Cidade",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          hintText: "Sua cidade",
        ),
      ),
    );
  }

  Container labelCEP() {
    return Container(
      width: 320,
      height: 60,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 3),
      child: TextField(
        controller: TextEditingController(text: "79630-033"),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CepInputFormatter(),
        ],
        decoration: InputDecoration(
          labelText: "CEP",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          hintText: "00.000-000",
        ),
      ),
    );
  }

  Container labelComplemento() {
    return Container(
      width: 320,
      height: 60,
      padding: EdgeInsets.only(left: 2, right: 2, bottom: 3),
      child: TextField(
        controller: TextEditingController(text: "Apartamento"),
        decoration: InputDecoration(
          labelText: "Complemento",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          hintText: "Ponto de referência",
        ),
      ),
    );
  }

  DropdownButtonFormField<String> estado() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
      ),
      value: _estadoSelecionado,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(fontSize: 18, color: Colors.black),
      onChanged: (String? value) {
        setState(() {
          _estadoSelecionado = value!;
        });
      },
      items: Estados.listaEstadosSigla
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.teko(
              fontSize: 20,
            ),
          ),
        );
      }).toList(),
    );
  }

  Container botaoConcluir(BuildContext context) {
    return Container(
      width: 310,
      height: 70,
      padding: EdgeInsets.only(left: 48, right: 48, top: 32, bottom: 8),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Concluir",
          style: GoogleFonts.ubuntu(
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
