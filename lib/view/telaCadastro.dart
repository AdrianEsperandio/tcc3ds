import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/models/userData.dart';
import 'package:tcc3ds/view/telaCadastroEndereco.dart';
import 'package:tcc3ds/view/telaLogin.dart';
import 'package:validatorless/validatorless.dart';

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaCadastrar();
  }
}

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({Key? key}) : super(key: key);

  @override
  _TelaCadastrarState createState() => _TelaCadastrarState();
}

final _formKey = GlobalKey<FormState>();

class _TelaCadastrarState extends State<TelaCadastrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
}

TextEditingController controllerNome = TextEditingController();
TextEditingController controllerSobrenome = TextEditingController();
TextEditingController controllerCPF = TextEditingController();
TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerSenha = TextEditingController();
TextEditingController controllerConfirmarSenha = TextEditingController();
TextEditingController controllerTelefone = TextEditingController();
TextEditingController controllerDataNasc = TextEditingController();
DatabaseHelper db = DatabaseHelper();

final formKey = GlobalKey<FormState>();

Scaffold _body(BuildContext context) {
  return Scaffold(
    body: ListView(
      padding: EdgeInsets.all(48),
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 25, bottom: 30),
              child: Text(
                'Emprestar livros agora \nficou mais fácil!',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            nome(),
            sobrenome(),
            cpf(),
            email(),
            senha(),
            confirmarSenha(),
            telefone(),
            dataNasc(),
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
                    final pessoa = new UserData(
                        nomeUsuario: controllerNome.text,
                        sobrenomeUsuario: controllerSobrenome.text,
                        cpfUsuario: controllerCPF.text,
                        emailUsuario: controllerEmail.text,
                        senhaUsuario: controllerSenha.text,
                        telefoneUsuario: controllerTelefone.text,
                        dataNasc: controllerDataNasc.text,
                        fotoUsuario: "Sem foof");

                    int? inserirUsuario = await db.insertUsuario(pessoa);

                    /*SharedPreferences sharedPreferencesGeral =
                        await SharedPreferences.getInstance();
                    sharedPreferencesGeral.setString(
                        "nomeUsuario", controllerNome.text);
                    sharedPreferencesGeral.setString(
                        "sobrenomeUsuario", controllerSobrenome.text);
                    sharedPreferencesGeral.setString(
                        "cpfUsuario", controllerCPF.text);
                    sharedPreferencesGeral.setString(
                        "emailUsuario", controllerEmail.text);
                    sharedPreferencesGeral.setString(
                        "senhaUsuario", controllerSenha.text);
                    sharedPreferencesGeral.setString(
                        "telefoneUsuario", controllerTelefone.text);
                    sharedPreferencesGeral.setString(
                        "dataNascUsuario", controllerDataNasc.text);
                    //sharedPreferencesGeral.setString(
                    //  "fotoUsuario", controllerFoto.text);
                    Get.to(TelaHome());*/
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CadastrarEndereco()));
                  }
                },
                child: Text(
                  "Continuar",
                  style: GoogleFonts.ubuntu(
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Já tem uma conta?",
                style: GoogleFonts.ubuntu(
                  fontSize: 19,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: GoogleFonts.teko(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TelaLogin()));
                },
                child: Text(
                  "Entrar",
                  style: GoogleFonts.ubuntu(
                    fontSize: 19,
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ],
    ),
  );
}

TextFormField nome() {
  return TextFormField(
    controller: controllerNome,
    validator: Validatorless.multiple([
      Validatorless.required("* Nome obrigatório"),
      Validatorless.max(20, "* Nome precisa conter no mínimo 20 caracteres"),
    ]),
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.account_circle),
      labelText: "Nome",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "Insira seu primeiro nome",
    ),
  );
}

TextFormField sobrenome() {
  return TextFormField(
    controller: controllerSobrenome,
    validator: Validatorless.multiple([
      Validatorless.required("* Sobrenome obrigatório"),
      Validatorless.max(
          20, "* Sobrenome precisa conter no mínimo 20 caracteres"),
    ]),
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.account_circle),
      fillColor: Colors.grey[20],
      filled: true,
      labelText: "Sobrenome",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "Insira seu sobrenome",
    ),
  );
}

TextFormField cpf() {
  return TextFormField(
    controller: controllerCPF,
    validator: Validatorless.multiple([
      Validatorless.required("* CPF obrigatório"),
      Validatorless.cpf("* CPF inválido"),
    ]),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      CpfInputFormatter(),
    ],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.person),
      labelText: "CPF",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "000.000.000-00",
    ),
  );
}

//email@qualquercoisa é válido?! :/
TextFormField email() {
  return TextFormField(
    controller: controllerEmail,
    validator: Validatorless.multiple([
      Validatorless.required("* Email obrigatório"),
      Validatorless.email("* Email inválido"),
    ]),
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.email),
      labelText: "Email",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "exemplo@gmail.com",
    ),
  );
}

TextFormField senha() {
  return TextFormField(
    controller: controllerSenha,
    validator: Validatorless.multiple([
      Validatorless.required("* Senha obrigatória"),
      Validatorless.min(6, "* Senha precisa de pelo menos 6 caracteres"),
    ]),
    obscureText: true,
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.lock),
      labelText: "Senha",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "Digite sua senha",
    ),
  );
}

TextFormField confirmarSenha() {
  return TextFormField(
    controller: controllerConfirmarSenha,
    validator: Validatorless.multiple([
      Validatorless.required("* Confirmação obrigatória"),
      Validatorless.min(6, "* Senha precisa de pelo menos 6 caracteres"),
      Validatorless.compare(controllerSenha, "* As senhas não coincidem"),
    ]),
    obscureText: true,
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.check),
      labelText: "Confirmar Senha",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "Digite sua senha novamente",
    ),
  );
}

TextFormField telefone() {
  return TextFormField(
    controller: controllerTelefone,
    validator: Validatorless.multiple([
      Validatorless.required("* Número de celular obrigatório"),
      Validatorless.min(15, "* Insira o número de celular completo"),
    ]),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      TelefoneInputFormatter(),
    ],
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.smartphone),
      labelText: "Celular",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "(DDD) + 00000-0000",
    ),
  );
}

TextFormField dataNasc() {
  return TextFormField(
    keyboardType: TextInputType.number,
    key: _formKey,
    controller: controllerDataNasc,
    validator: Validatorless.multiple([
      Validatorless.required("* Data obrigatória"),
      Validatorless.min(10, "* Insira a data completa"),
    ]),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      DataInputFormatter(),
    ],
    decoration: InputDecoration(
      fillColor: Colors.grey[20],
      filled: true,
      prefixIcon: Icon(Icons.event),
      labelText: "Data de Nascimento",
      labelStyle: GoogleFonts.teko(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      hintText: "DD/MM/AAAA",
    ),
  );
}
