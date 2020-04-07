import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_flutter/app/shared/widgets/combobox/combobox_controller.dart';
import 'package:hasura_flutter/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hasura_flutter/app/app_widget.dart';
import 'package:hasura_flutter/app/modules/home/home_module.dart';
import 'package:hasura_flutter/app/modules/add_produto/add_produto_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ComboboxController()),
        Bind((i) => AppController()),

        // Outros
        Bind((i) => HasuraConnect(
            "https://loja-hasura-teste.herokuapp.com/v1/graphql")),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/addProduto', module: AddProdutoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
