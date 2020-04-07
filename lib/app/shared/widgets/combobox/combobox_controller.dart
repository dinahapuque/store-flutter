import 'package:mobx/mobx.dart';

part 'combobox_controller.g.dart';

class ComboboxController = _ComboboxControllerBase with _$ComboboxController;

abstract class _ComboboxControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  