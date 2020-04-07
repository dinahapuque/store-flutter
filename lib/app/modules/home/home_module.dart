import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_flutter/app/app_module.dart';
import 'package:hasura_flutter/app/modules/home/pages/update_produto/repositories/update_produto_repository.dart';
import 'package:hasura_flutter/app/modules/home/pages/update_produto/update_produto_controller.dart';
import 'package:hasura_flutter/app/modules/home/pages/update_produto/update_produto_page.dart';
import 'package:hasura_flutter/app/modules/home/repositories/home_repository.dart';
import 'package:hasura_flutter/app/modules/home/widgets/card_produto/card_produto_controller.dart';
import 'package:hasura_flutter/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_flutter/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Controllers
        Bind((i) => CardProdutoController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        Bind((i) => UpdateProdutoController(i.get<UpdateProdutoRepository>()), singleton: false),
 
        // Repositories
        Bind((i) => HomeRepository(AppModule.to.get<HasuraConnect>())),
        Bind((i) => UpdateProdutoRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/updateProduto/:id', child: (_, args) => UpdateProdutoPage(produtoId: args.params['id'])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
