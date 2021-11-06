import 'package:doctor_ie/cadastrar/cadastrar_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 50, left: 60, right: 60),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 382,
              height: 274,
              child: Image.asset("assets/logo2.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: const Text(
                    "Cadastrar Produto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastrarPage(),
                        settings: const RouteSettings(name: "/cadastrarPage"),
                      ),
                    );
                  }  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}