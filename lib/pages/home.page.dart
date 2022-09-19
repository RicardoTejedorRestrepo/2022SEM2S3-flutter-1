import 'package:flutter/material.dart';
import 'package:newnoticias/models/articulo.model.dart';
import 'package:newnoticias/providers/articulos.provider.dart';
import 'package:newnoticias/windgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArticuloProvider articuloProvider =ArticuloProvider();
  late Future<List<ArticuloModel>> articulos;
  @override
  void initState() {
     var respuesta = articuloProvider.obtenerArticulo();
    super.initState();
    
  }
  String titulo='Noticias';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(titulo),),
      body: FutureBuilder(
        future: articulos,
        builder: ((context, snapshot) {
          List<Widget> lista = [];

          if(snapshot.hasData){
            snapshot.data?.forEach((element) => lista.add(CardWindget(articulo: element)));
            return ListView(
              children: lista,
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }          
        }),
      ),
    );
  }
}