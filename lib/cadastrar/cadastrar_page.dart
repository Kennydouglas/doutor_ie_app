import 'package:doctor_ie/cadastrar/cadastrar_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastrarPage extends StatefulWidget {
  const CadastrarPage({Key? key}) : super(key: key);

  @override
  CadastrarPageState createState() => CadastrarPageState();
}

var nomeController = TextEditingController();
var descricaoController = TextEditingController(); 
var valorController = TextEditingController(); 

class CadastrarPageState extends State {

  CadastrarBloc bloc = CadastrarBloc();
   
  String nome = nomeController.text;
  String descricao = descricaoController.text;
  String valor = valorController.text;
  var maskFormatterString = MaskTextInputFormatter(
      mask: '############', filter: {"#": RegExp(r'[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]')});
      
  var maskFormatterValor = MaskTextInputFormatter(
      mask: '#,##', filter: {"#": RegExp(r'[0-9]')});    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 60, left: 60, right: 60),
        //color: Colors.white,
        child: ListView(
          children: <Widget>[
            const Text(
              "Cadastro de Produtos",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,  
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Nome:",
              style: TextStyle(
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nomeController,
              keyboardType: TextInputType.name,
              cursorColor: Colors.grey,
              inputFormatters: [maskFormatterString],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                ),
                labelStyle:  TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Descrição:",
              style: TextStyle(
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: descricaoController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.grey,
              inputFormatters: [maskFormatterString],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                ),
                labelStyle:  TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Valor:",
              style: TextStyle(
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: valorController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.grey,
              inputFormatters: [maskFormatterValor],
              decoration: const InputDecoration(
                hintText: 'R\$ 0,00',
                contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(left:15,right: 15),
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
                    "Enviar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onPressed: () async {
                    await bloc.cadastrarPage(nome, descricao, valor);
                    
                  }
                ),
              ),
            ),
            const SizedBox(height: 20),
            StreamBuilder(
              stream: bloc.output,
              builder: (context, snapshot) {
                if(bloc.mensagem == true){
                  return const Text("Cadastro feito com sucesso!");
                }
                else{
                  return const Text("Aguardando!");
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}