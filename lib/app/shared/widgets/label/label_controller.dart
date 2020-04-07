import 'package:mobx/mobx.dart';

part 'label_controller.g.dart';

class LabelController = _LabelControllerBase with _$LabelController;

abstract class _LabelControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
  