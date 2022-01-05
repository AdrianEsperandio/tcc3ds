import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc3ds/components/livrosRecomendados.dart';
import 'package:tcc3ds/components/showBook.dart';
import 'package:tcc3ds/database/database_helper.dart';
import 'package:tcc3ds/models/bookData.dart';
import 'package:tcc3ds/view/telaConfiguracoes.dart';
import 'package:tcc3ds/view/telaDesafios.dart';
import 'package:tcc3ds/view/telaLogin.dart';
import 'package:tcc3ds/view/telaMochila.dart';
import 'package:tcc3ds/view/telaPerfil.dart';
import 'package:tcc3ds/view/telaPesquisa.dart';
import 'package:google_fonts/google_fonts.dart';

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 35, bottom: 12),
          child: Image.asset('assets/logo2.png', height: 46, width: 40),
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
        actions: <Widget>[
          Center(
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.backpack, size: 30),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TelaMochila()));
                    },
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(left: 26, top: 30),
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        "${MochilaProvider.length}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Icon(Icons.search),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => TelaPesquisa()));
        },
        tooltip: "Pesquisar",
      ),
    );
  }
}

DatabaseHelper db = DatabaseHelper();

_body() {
  return SingleChildScrollView(
      child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Center(
          child: Text(
            'Bem-vindo, Clayson!',
            style: GoogleFonts.bebasNeue(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          "Populares da Semana",
          style: GoogleFonts.fjallaOne(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: livrosHome.length,
            itemBuilder: (ctx, i) => ShowBook(i),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Recomendados",
          style: GoogleFonts.fjallaOne(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: livrosRecomendados.length,
            itemBuilder: (ctx, i) => LivrosRecomendados(i),
          ),
        ),
      ],
    ),
  ));
}

// criando o drawer
class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final nome = "Clayson Geraldo";
    final email = "claysonbr@gmail.com";
    final urlImage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqvnR6p3dKTh_3Atmrdcow6JMoUKNN-bnvLCACZVhvJibQzHcLPRgJ5-ySPVchMXdGBp4&usqp=CAU";
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: ListView(
              children: <Widget>[
                buildHeader(
                  urlImage: urlImage,
                  nome: nome,
                  email: email,
                  onClicked: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TelaPerfil()));
                  },
                ),
                const SizedBox(height: 10),
                Divider(color: Colors.white),
                const SizedBox(height: 10),
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      drawerPerfil(context),
                      Divider(
                        height: 18,
                      ),
                      drawerPedidos(),
                      Divider(
                        height: 18,
                      ),
                      drawerDesafios(context),
                      Divider(
                        height: 18,
                      ),
                      drawerNotificacoes(),
                      Divider(
                        height: 18,
                      ),
                      drawerConfiguracoes(context),
                      Divider(
                        height: 18,
                      ),
                      drawerSair(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  ListTile drawerPerfil(BuildContext context) {
    return ListTile(
      title: Text(
        "Perfil",
        style: GoogleFonts.carroisGothic(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      leading: Icon(
        Icons.person,
        color: Colors.white,
      ),
      hoverColor: Colors.white,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => TelaPerfil()));
      },
    );
  }

  ListTile drawerPedidos() {
    return ListTile(
      title: Text(
        "Pedidos",
        style: GoogleFonts.carroisGothic(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      leading: Icon(
        Icons.book,
        color: Colors.white,
      ),
      hoverColor: Colors.white,
    );
  }

  ListTile drawerDesafios(BuildContext context) {
    return ListTile(
      title: Text(
        "Desafios",
        style: GoogleFonts.carroisGothic(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      leading: Icon(
        Icons.psychology,
        color: Colors.white,
      ),
      hoverColor: Colors.white,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => TelaDesafios()));
      },
    );
  }

  ListTile drawerNotificacoes() {
    return ListTile(
      title: Text(
        "Notificações",
        style: GoogleFonts.carroisGothic(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            ),
        ),
      ),
      leading: Icon(
        Icons.notifications,
        color: Colors.white,
      ),
      hoverColor: Colors.white,
    );
  }

  ListTile drawerConfiguracoes(BuildContext context) {
    return ListTile(
      title: Text(
        "Configurações",
        style: GoogleFonts.carroisGothic(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      leading: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      hoverColor: Colors.white,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => ConfigTela()));
      },
    );
  }

  ListTile drawerSair(BuildContext context) {
    return ListTile(
      title: Text(
        "Sair",
        style: GoogleFonts.carroisGothic(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      leading: Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      hoverColor: Colors.white,
      onTap: () async {
        final SharedPreferences sharedPreferencesSair =
            await SharedPreferences.getInstance();
        sharedPreferencesSair.clear();
        Get.to(TelaLogin());
      },
    );
  }

  // É aqui onde é criado o cabeçalho do drawer com
  // a foto e o nome do usuário
  Widget buildHeader({
    required String urlImage,
    required String nome,
    required String email,
    VoidCallback? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(urlImage),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: GoogleFonts.carroisGothic(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: GoogleFonts.carroisGothic(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
