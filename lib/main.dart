import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/view/telaDetalhesLivro.dart';
import 'package:tcc3ds/view/telaHome.dart';
import 'package:tcc3ds/view/telaLogin.dart';

String? finalEmail;

void main() async {
  runApp(TelaInicial());
  DatabaseHelper.instance.databaseCall();
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaAbertura(),
      onGenerateRoute: processarRotaComParametro,
    );
  }
}

bool animLogo = false;
bool animForm = false;

Route<dynamic> processarRotaComParametro(RouteSettings settings) {
  return MaterialPageRoute(builder: (ctx) => DetailLivro(settings.arguments));
}

class TelaAbertura extends StatefulWidget {
  const TelaAbertura({Key? key}) : super(key: key);

  @override
  _TelaAberturaState createState() => _TelaAberturaState();
}

class _TelaAberturaState extends State<TelaAbertura> {
  @override
  void initState() {
    getLoginData().whenComplete(() async {
      Timer(Duration(seconds: 7),
          () => Get.to(finalEmail == null ? TelaLogin() : TelaHome()));
    });
    activateAnimLogo();

    super.initState();
  }

  Future getLoginData() async {
    final SharedPreferences sharedPreferencesLogin =
        await SharedPreferences.getInstance();
    var nomeObtido = sharedPreferencesLogin.getString("emailUsuario");
    setState(() {
      finalEmail = nomeObtido;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  void activateAnimLogo() async {
    await Future.delayed(Duration(milliseconds: 250));
    animLogo = true;
  }
}

_body(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                'assets/MenuScreenSolidWall2.jpg'),
            fit: BoxFit.cover)),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 70),
                AnimatedContainer(
                  padding: const EdgeInsets.only(top: 60),
                  duration: Duration(
                    milliseconds: 990,
                  ),
                  height: (!animLogo)? 0 : 340,
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                  curve: Curves.decelerate,
                ),
                SizedBox(height: 50),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 2700),
                  opacity: (!animLogo)? 0 : 1,
                  child: SizedBox(
                    width: 260,
                    child: Text(
                      "\"Livros não mudam o mundo. Livros mudam pessoas. Pessoas mudam o mundo.\"",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                  ),
                  ),
                  SizedBox(height: 10),
                  AnimatedOpacity(
                  duration: Duration(milliseconds: 3500),
                  opacity: (!animLogo)? 0 : 1,
                  child: SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                          "MÁRIO QUINTANA",
                          style: TextStyle(color: Colors.white,
                           fontWeight: FontWeight.bold,
                            fontSize: 16,
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                  ),
               // textoConectando(),
               // carregamentoFake(),
              ],
            ),
          ),      
      ),
    ),
  );
}

Container textoConectando() {
  return Container(
      padding: EdgeInsets.only(bottom: 10, top: 150),
      child: Text(
        "Conectando...",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ));
}

Container carregamentoFake() {
  return Container(
    padding: EdgeInsets.only(right: 100, left: 100, bottom: 10, top: 30),
    child: LinearProgressIndicator(
      minHeight: 12,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      backgroundColor: Colors.black12,
      //value: _downloadPercentage,
    ),
  );
}
