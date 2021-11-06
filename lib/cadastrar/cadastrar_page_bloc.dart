import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CadastrarBloc{

  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;
  bool mensagem = false;

  cadastrarPage(String nome, String descricao, String valor) async{

    String url = 'https://www.tecnleaf.com.br/cadastrar.php';
    var data = {'nome': nome, 'descricao': descricao, 'valor': valor};
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    //mensagem = jsonDecode(response.body);
    if(response.statusCode == 200){
      mensagem = true;
      input.add(mensagem);
    }
  }

}