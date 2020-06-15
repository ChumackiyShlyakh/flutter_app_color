import 'dart:math';
import 'package:flutterappcolor/ui/screen/view_interface.dart';
import 'package:mvvm_flutter/base_model/base_model.dart';
import 'package:mvvm_flutter/base_model/livedata_observer.dart';

class ColorChangerViewModel extends BaseViewModel implements ViewInterface {

  ColorChangerViewModel() {
    backgroundColor = initColor;
    incrementedValue = LiveData<int>(value: 0);
    incrementedValue.listener(this, changedValue);
  }

  int initColor = 0xff38c286;
  int backgroundColor;

  List<String> _items;

  List<String> get items => _items;

  LiveData<int> incrementedValue;

  Future<void> doSomeNetworkCall() async {
    showProgressbar();
    return Future.delayed(Duration(seconds: 0)).then((_) {
      incrementedValue.emitValue(incrementedValue.value + 1);
      backgroundColor = (Random().nextDouble() * 0xFFFFFF00).toInt();
      hideProgressbar();
    });
  }

  @override
  void onChangeBackground() async {
    doSomeNetworkCall();
  }

  void changedValue(int value) {}
}