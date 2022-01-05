import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc3ds/models/userData.dart';
import 'package:tcc3ds/services/login_response.dart';
import 'package:tcc3ds/view/telaCadastro.dart';
import 'package:tcc3ds/view/telaHome.dart';
import 'package:validatorless/validatorless.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaLogar();
  }
}

class TelaLogar extends StatefulWidget {
  TelaLogar({Key? key}) : super(key: key);

  @override
  _TelaLogar createState() => _TelaLogar();
}

class _TelaLogar extends State<TelaLogar> implements LoginCallBack {
  BuildContext? _ctx;
  bool _isLoading = false;
  final _formKeyLogin = new GlobalKey<FormState>();
  //final _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? _email, _senha;
  LoginResponse? _response;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  _TelaLogar() {
    _response = new LoginResponse(this);
  }

  void _submit() {
    final form = _formKeyLogin.currentState;
    if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _response!.doLogin(_email!, _senha!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    return Scaffold(
      body: _body(),
    );
  }

  Center _body() {
    return Center(
      child: Form(
        key: _formKeyLogin,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 48),
          children: <Widget>[
            SizedBox(height: 16),
            logo(),
            SizedBox(height: 8),
            labelEmail(),
            labelSenha(),
            botaoEntrar(),
            esqueciSenha(),
            criarConta(),
          ],
        ),
      ),
    );
  }

  Container logo() {
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Image.asset('assets/logo.png'),
      width: 600,
      height: 270,
    );
  }

  Container labelEmail() {
    return Container(
      width: 320,
      height: 75,
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 3),
      child: TextFormField(
        controller: controllerEmail,
        validator: Validatorless.multiple([
          Validatorless.required("* Email obrigatório"),
          Validatorless.email("* Email inválido"),
        ]),
        onSaved: (val) => _email = val,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          labelText: "Email",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          border: OutlineInputBorder(
              borderRadius:
                  const BorderRadius.all(const Radius.circular(60.0))),
          hintText: "exemplo@gmail.com",
        ),
      ),
    );
  }

  Container labelSenha() {
    return Container(
      width: 320,
      height: 75,
      padding: EdgeInsets.only(left: 8, right: 8, top: 3),
      child: TextFormField(
        controller: controllerSenha,
        validator: Validatorless.multiple([
          Validatorless.required("* Senha obrigatória"),
          Validatorless.min(6, "* Senha precisa de pelo menos 6 caracteres"),
        ]),
        onSaved: (val) => _senha = val,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: "Senha",
          labelStyle: GoogleFonts.teko(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          border: OutlineInputBorder(
              borderRadius:
                  const BorderRadius.all(const Radius.circular(60.0))),
          hintText: "Digite sua senha",
        ),
      ),
    );
  }

  Container botaoEntrar() {
    return Container(
      width: 310,
      height: 70,
      padding: EdgeInsets.only(left: 18, right: 18, top: 32, bottom: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue))),
        ),
        onPressed: () async {
          _submit();
          SharedPreferences sharedPreferencesEmail =
              await SharedPreferences.getInstance();
          sharedPreferencesEmail.setString(
              "emailUsuario", controllerEmail.text);
        },
        child: Text(
          "Entrar",
          style: GoogleFonts.ubuntu(
            fontSize: 19,
          ),
        ),
      ),
    );
  }

  Container esqueciSenha() {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 15),
        ),
        onPressed: () {},
        child: Text(
          "Esqueci minha senha",
          style: GoogleFonts.ubuntu(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Row criarConta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Novo usuário?",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              primary: Colors.blue,
              textStyle: TextStyle(
                fontSize: 18,
              )),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TelaCadastro()));
          },
          child: Text(
            "Criar conta",
            style: GoogleFonts.ubuntu(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onLoginError(String? error) {
    print(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(UserData? usuario) {
    if (usuario != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => TelaHome()));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
