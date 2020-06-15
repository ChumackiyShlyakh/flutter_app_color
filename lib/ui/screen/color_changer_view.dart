import 'package:flutter/material.dart';
import 'package:flutterappcolor/ui/viewmodel/color_change_view_model.dart';
import 'package:mvvm_flutter/base_view/base_state.dart';

class ColorChangerView extends StatefulWidget {
  @override
  _ColorChangerViewState createState() => _ColorChangerViewState();
}

class _ColorChangerViewState
    extends BaseState<ColorChangerViewModel, ColorChangerView> {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  void initViewModel() {
    viewModel = ColorChangerViewModel();

    viewModel.incrementedValue.listener(viewModel, changedValue);
  }

  @override
  Widget stateWidgetBuilder(
      BuildContext context, ChildrenHolder childrenHolder) {
    return Scaffold(
      appBar: AppBar(
//        title: childrenHolder.children[Random().nextInt(3)]
        title: Text("Flutter colors test"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: viewModel.onChangeBackground,
//              viewModel.doSomeNetworkCall(),
              child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 300,
                ),
                color: Color(viewModel.backgroundColor),
                child: Center(
                      child: Text(
//                        "Hey there" + " - " + "${viewModel.incrementedValue.value}",   // Can count clicks
                        "Hey there",
                        style: TextStyle(
                            fontSize: 3 * sizeConfig.textMultiplier),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> reuseChildren() {
    return [
      Text("Flutter colors test 1"),
      Text("Flutter colors test 2"),
      Text("Flutter colors test 3"),
    ];
  }

  void changedValue(int value) {
  }
}