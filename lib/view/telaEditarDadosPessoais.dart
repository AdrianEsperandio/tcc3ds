import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/view/telaMeusDados.dart';
import 'package:brasil_fields/brasil_fields.dart';

class EditarDadosPessoais extends StatelessWidget {
  const EditarDadosPessoais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DadosPessoaisEditar();
  }
}

class DadosPessoaisEditar extends StatefulWidget {
  const DadosPessoaisEditar({Key? key}) : super(key: key);

  @override
  _DadosPessoaisEditarState createState() => _DadosPessoaisEditarState();
}

class _DadosPessoaisEditarState extends State<DadosPessoaisEditar> {
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
            "Meus Dados",
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
                    builder: (BuildContext context) => MeusDados()));
          },
        ),
      ),
      body: _body(context),
    );
  }
}

Scaffold _body(BuildContext context) {
  return Scaffold(
    body: ListView(
        padding: EdgeInsets.only(right: 48, left: 48, top: 24),
        children: <Widget>[
          labelNome(),
          labelSobrenome(),
          labelCPF(),
          labelEmail(),
          labelSenha(),
          labelConfirmarSenha(),
          labelTelefone(),
          labelDataNasc(),
          botaoConcluir(context),
        ]),
  );
}

Container labelNome() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: TextEditingController(text: "Clayson"),
      decoration: InputDecoration(
        labelText: "Nome",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Insira seu primeiro nome",
      ),
    ),
  );
}

Container labelSobrenome() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: TextEditingController(text: "Geraldo"),
      decoration: InputDecoration(
        labelText: "Sobrenome",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Insira seu sobrenome",
      ),
    ),
  );
}

Container labelCPF() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: TextEditingController(text: "112.491.220-74"),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter(),
      ],
      decoration: InputDecoration(
        labelText: "CPF",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "000.000.000-00",
      ),
    ),
  );
}

Container labelEmail() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: TextEditingController(text: "claysonbr@gmail.com"),
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "exemplo@gmail.com",
      ),
    ),
  );
}

Container labelSenha() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, top: 3),
    child: TextField(
      controller: TextEditingController(text: "1234567"),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Digite sua senha",
      ),
    ),
  );
}

Container labelConfirmarSenha() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, top: 3),
    child: TextField(
      controller: TextEditingController(text: "1234567"),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirmar Senha",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Digite sua senha novamente",
      ),
    ),
  );
}

Container labelTelefone() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: TextEditingController(text: "(16) 90781-5445"),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      decoration: InputDecoration(
        labelText: "Telefone",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "(DDD) 00000-0000",
      ),
    ),
  );
}

Container labelDataNasc() {
  return Container(
    width: 320,
    height: 60,
    padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
    child: TextField(
      controller: TextEditingController(text: "15/01/1998"),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DataInputFormatter(),
      ],
      decoration: InputDecoration(
        labelText: "Data de Nascimento",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "DD/MM/AAAA",
      ),
    ),
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
