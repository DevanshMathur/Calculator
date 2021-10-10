import 'package:calculator/utils/app_utils.dart';
import 'package:calculator/utils/enum/button_name_enum.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final ButtonNameEnum buttonName;
  final Function callback;

  const Buttons(this.buttonName, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => callback(buttonName),
        child: Text(
          AppUtils.getButtonText(buttonName),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
