import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class ComboboxWidget extends StatelessWidget {
  final List<Model> items;
  final Function(Model) onChanged;
  final Model itemSelecionado;

  const ComboboxWidget(
      {Key key,
      @required this.items,
      @required this.onChanged,
      @required this.itemSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FindDropdown<Model>(
        items: items,
        selectedItem: itemSelecionado,
        onChanged: (Model item) => onChanged(item),
        validate: (Model item) {
          if (item == null)
            return "Selecione uma opção";
          else
            return null;
        },
        dropdownBuilder: (_, model) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: model?.id == null
                ? ListTile(
                    title: Text(
                      "Selecione",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                : ListTile(
                    title: Text(
                      model.descricao,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
          );
        });
  }
}

class Model {
  final String id;
  final String descricao;

  Model(this.id, this.descricao);

  @override
  String toString() {
    super.toString();
    return this.descricao;
  }

  @override
  operator ==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
