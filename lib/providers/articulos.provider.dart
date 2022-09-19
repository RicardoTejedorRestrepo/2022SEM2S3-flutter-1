import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newnoticias/models/articulo.model.dart';

class ArticuloProvider{
  Future<List<ArticuloModel>> obtenerArticulo() async {

    List<ArticuloModel> articulos = [];
    var client = http.Client();

  try{
    Map<String, String> parametros={
    'q':'tesla',
    'from':'2022-08-17',
    'sortBy':'publishedAt',
    'apiKey':'03359025582f44709854388d046a1c90'
    };
    var url = Uri.https('https://newsapi.org', 'v2/everything', parametros);
    var response = await client.get(url);

     var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodedResponse['articulos']
          .forEach((item) => articulos.add(ArticuloModel.fromJson(item)));

    print(response.body);

    return articulos;

  }finally{
    client.close();

  }
  }
}
