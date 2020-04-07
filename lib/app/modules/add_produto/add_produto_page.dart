import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_flutter/app/modules/add_produto/add_produto_controller.dart';
import 'package:hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_flutter/app/shared/widgets/combobox/combobox_widget.dart';
import 'package:hasura_flutter/app/shared/widgets/label/label_widget.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"})
      : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState
    extends ModularState<AddProdutoPage, AddProdutoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height - 250,
            right: -50,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
              radius: 130,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 50,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
              radius: 130,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 150,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
              radius: 130,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LabelWidget(
                  title: "Descrição",
                ),
                TextField(
                  onChanged: controller.setDescricao,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    hintText: "Descrição do Produto",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                LabelWidget(
                  title: "Valor",
                ),
                TextField(
                  onChanged: controller.setValor,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    hintText: "Descrição do Produto",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                LabelWidget(
                  title: "Categoria",
                ),
                Observer(
                  builder: (context) {
                    var list = controller.tipoProduto == null
                        ? []
                        : controller.tipoProduto.categoriaProduto;

                    return ComboboxWidget(
                      items: list
                          .map((data) => Model(data.id, data.descricao))
                          .toList(),
                      itemSelecionado: null,
                      onChanged: (tipo) => controller.setSelectedCategoria(
                        TipoECategoriaDto(
                            id: tipo.id, descricao: tipo.descricao),
                      ),
                    );
                  },
                ),
                LabelWidget(
                  title: "Tipo",
                ),
                Observer(
                  builder: (context) {
                    var list = controller.tipoProduto == null
                        ? []
                        : controller.tipoProduto.tipoProduto;
                    return ComboboxWidget(
                      items: list
                          .map((data) => Model(data.id, data.descricao))
                          .toList(),
                      itemSelecionado: null,
                      onChanged: (tipo) => controller.setSelectedTipo(
                        TipoECategoriaDto(
                            id: tipo.id, descricao: tipo.descricao),
                      ),
                    );
                  },
                ),
                SizedBox(height: 18),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      bool res = await controller.adicionar();
                      if (res) {
                        Navigator.of(context).pop();
                      } else {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            content: Text("Erro ao tentar salvar o produto!"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Fechar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Adicionar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
