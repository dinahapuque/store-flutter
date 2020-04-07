import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_flutter/app/modules/home/home_controller.dart';
import 'package:hasura_flutter/app/modules/home/widgets/card_produto/card_produto_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (controller.listaProdutos.hasError)
            return Center(
              child: Text("Ocorreu um erro ao realizar essa requisição"),
            );

          if (controller.listaProdutos.value == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          controller.listaProdutos.value
              .sort((p1, p2) => p1.nome.toUpperCase().compareTo(p2.nome.toUpperCase()));

          return ListView.builder(
            itemCount: controller.listaProdutos.value.length,
            itemBuilder: (BuildContext context, int index) {
              return CardProdutoWidget(
                nomeProduto: "${controller.listaProdutos.value[index].nome}",
                valorProduto: "${controller.listaProdutos.value[index].valor}",
                categoriaProduto:
                    "${controller.listaProdutos.value[index].categoriaProduto.descricao}",
                tipoProduto:
                    "${controller.listaProdutos.value[index].tipoProduto.descricao}",
                produtoId: "${controller.listaProdutos.value[index].id}",
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addProduto");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
