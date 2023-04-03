import 'dart:convert';
import 'package:http/http.dart' as http;

class Connect {
  //===================================================================================
  Future fetchUserData() async {
    final response = await http.get(Uri.parse(
        'https://apex.oracle.com/pls/apex/marco0antonio/data/testando'));

    if (response.statusCode == 200) {
      // Dados recebidos com sucesso
      final data = jsonDecode(response.body)['items'];

      return data;
      // Faça algo com os dados recebidos
    } else {
      // Algo deu errado
      throw Exception('Falha ao carregar dados da API');
    }
  }
  //===================================================================================
}

class convert_json {
  String? titulo;
  String? receita;
  String? image;
  String? avaliacao;
  String? tempo_de_preparo;
  String? rendimento;

  convert_json({
    this.titulo,
    this.receita,
    this.image,
    this.avaliacao,
    this.tempo_de_preparo,
    this.rendimento,
  });
}
