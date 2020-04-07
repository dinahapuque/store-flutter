import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_flutter/app/modules/home/home_module.dart';
import 'package:hasura_flutter/app/shared/widgets/combobox/combobox_widget.dart';
import 'package:hasura_flutter/app/shared/widgets/label/label_widget.dart';
import 'update_produto_controller.dart';

class UpdateProdutoPage extends StatefulWidget {
  final String produtoId;
  final String title;

  const UpdateProdutoPage(
      {Key key, this.title = "UpdateProduto", this.produtoId})
      : super(key: key);

  @override
  _UpdateProdutoPageState createState() => _UpdateProdutoPageState();
}

class _UpdateProdutoPageState
    extends ModularState<UpdateProdutoPage, UpdateProdutoController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();

    controller.setId(widget.produtoId);
  }

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
          Observer(builder: (context) {
            if (controller.updatedProduto == null)
              return Center(child: CircularProgressIndicator());
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LabelWidget(
                    title: "Descrição",
                  ),
                  TextField(
                    controller: controller.descricaoController,
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
                    controller: controller.valorController,
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
                  ComboboxWidget(
                    items: (controller.updatedProduto == null
                            ? []
                            : controller.updatedProduto.categoriaProduto)
                        .map((data) => Model(data.id, data.descricao))
                        .toList(),
                    itemSelecionado: controller.selectedCategoria == null
                        ? controller.selectedCategoria
                        : Model(controller.selectedCategoria.id,
                            controller.selectedCategoria.descricao),
                    onChanged: (tipo) => controller.setSelectedCategoria(
                      TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao),
                    ),
                  ),
                  LabelWidget(
                    title: "Tipo",
                  ),
                  ComboboxWidget(
                    items: controller.updatedProduto == null
                        ? []
                        : controller.updatedProduto.tipoProduto
                            .map((data) => Model(data.id, data.descricao))
                            .toList(),
                    itemSelecionado: controller.selectedTipo == null
                        ? controller.selectedTipo
                        : Model(controller.selectedTipo.id,
                            controller.selectedTipo.descricao),
                    onChanged: (tipo) => controller.setSelectedTipo(
                      TipoECategoriaDto(id: tipo.id, descricao: tipo.descricao),
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        bool res = await controller.salvar();
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
                          "Salvar",
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
            );
          }),
        ],
      ),
    );
  }
}
