import 'package:flutter/material.dart';

class CardProdutoWidget extends StatelessWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valorProduto;
  final String produtoId;

  const CardProdutoWidget(
      {Key key,
      @required this.nomeProduto,
      @required this.categoriaProduto,
      @required this.tipoProduto,
      @required this.valorProduto,
      @required this.produtoId
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/updateProduto/$produtoId");
      },
      child: Card(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 50,
              right: -50,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
                radius: 130,
              ),
            ),
            Positioned(
              top: 100,
              right: 50,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
                radius: 130,
              ),
            ),
            Positioned(
              top: 120,
              right: 150,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
                radius: 130,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    nomeProduto,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    categoriaProduto,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          tipoProduto,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "R\$ ${double.parse(valorProduto).toStringAsFixed(2).replaceAll('.', ',')}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
