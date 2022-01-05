import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/models/addressData.dart';
import 'package:tcc3ds/view/telaHome.dart';
import 'package:validatorless/validatorless.dart';

class CadastrarEndereco extends StatefulWidget {
  const CadastrarEndereco({Key? key}) : super(key: key);

  @override
  _CadastrarEnderecoState createState() => _CadastrarEnderecoState();
}

TextEditingController controllerRua = TextEditingController();
TextEditingController controllerBairro = TextEditingController();
TextEditingController controllerNumero = TextEditingController();
TextEditingController controllerCEP = TextEditingController();
TextEditingController controllerCidade = TextEditingController();
TextEditingController controllerEstado = TextEditingController();
TextEditingController controllerComplemento = TextEditingController();
DatabaseHelper db = DatabaseHelper();

final formKey = GlobalKey<FormState>();

String _estadoSelecionado = "AC";

class _CadastrarEnderecoState extends State<CadastrarEndereco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return ListView(children: [
      Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(48),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 6, bottom: 30),
                child: Text(
                  "Cadastre seu endereço",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              rua(),
              numero(),
              bairro(),
              cidade(),
              cep(),
              complemento(),
              estado(),
              SizedBox(height: 25),
              SizedBox(
                height: 30,
                width: 245,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue))),
                  ),
                  onPressed: () async {
                    var formValid = formKey.currentState!.validate();
                    if (formValid) {
                      DatabaseHelper.instance.databaseCall();

                      final enderecoDaPessoa = new AddressData(
                        idEndereco: null,
                        ruaEndereco: controllerRua.text,
                        numeroEndereco: controllerNumero.text,
                        bairroEndereco: controllerBairro.text,
                        cidadeEndereco: controllerCidade.text,
                        cepEndereco: controllerCEP.text,
                        complementoEndereco: controllerComplemento.text,
                        estadoEndereco:
                            _estadoSelecionado. /*value.*/ toString(),
                      );

                      int? inserirEndereco =
                          await db.insertEndereco(enderecoDaPessoa);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TelaHome()));
                    }
                  },
                  child: Text(
                    "Finalizar",
                    style: GoogleFonts.ubuntu(
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  TextFormField rua() {
    return TextFormField(
      controller: controllerRua,
      validator: Validatorless.multiple([
        Validatorless.required("* Rua obrigatória"),
        Validatorless.max(30, "* Rua precisa conter no mínimo 30 caracteres"),
      ]),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
        labelText: "Rua",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Jardim das Flores",
      ),
    );
  }

  TextFormField numero() {
    return TextFormField(
      controller: controllerNumero,
      validator: Validatorless.multiple([
        Validatorless.required("* Número obrigatório"),
        Validatorless.number("* Número inválido"),
        Validatorless.max(4, "* Número precisa conter no mínimo 4 caracteres")
      ]),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
        labelText: "Número",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "0000",
      ),
    );
  }

  TextFormField bairro() {
    return TextFormField(
      controller: controllerBairro,
      validator: Validatorless.multiple([
        Validatorless.required("* Bairro obrigatório"),
        Validatorless.max(
            30, "* Bairro precisa conter no mínimo 30 caracteres"),
      ]),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
        labelText: "Bairro",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Jardim dos Anjos",
      ),
    );
  }

  TextFormField cidade() {
    return TextFormField(
      controller: controllerCidade,
      validator: Validatorless.multiple([
        Validatorless.required("* Cidade obrigatória"),
        Validatorless.max(
            30, "* Cidade precisa conter no mínimo 30 caracteres"),
      ]),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
        labelText: "Cidade",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Sua cidade",
      ),
    );
  }

  TextFormField cep() {
    return TextFormField(
      controller: controllerCEP,
      validator: Validatorless.multiple([
        Validatorless.required("* CEP obrigatório"),
        Validatorless.min(9, "CEP precisa conter no mínimo 9 caracteres"),
      ]),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CepInputFormatter(),
      ],
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
        labelText: "CEP",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "00.000-000",
      ),
    );
  }

  TextFormField complemento() {
    return TextFormField(
      controller: controllerComplemento,
      validator: Validatorless.multiple([
        Validatorless.required("* Complemento obrigatório"),
        Validatorless.max(
            200, "* Complemento precisa conter no mínimo 200 caracteres"),
      ]),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
        labelText: "Complemento",
        labelStyle: GoogleFonts.teko(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: "Ponto de referência",
      ),
    );
  }

  DropdownButtonFormField<String> estado() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        fillColor: Colors.grey[20],
        filled: true,
      ),
      validator: Validatorless.multiple([
        Validatorless.required("* Estado obrigatório"),
        Validatorless.min(2, "* Estado precisa conter no mínimo 2 caracteres"),
      ]),
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
              //fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        );
      }).toList(),
    );
  }
}
