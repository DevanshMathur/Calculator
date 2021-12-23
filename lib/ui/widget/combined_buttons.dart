import 'package:calculator/utils/enum/button_name_enum.dart';
import 'package:flutter/material.dart';

import 'butons.dart';

class CombinedButtons extends StatelessWidget {
  final Function operation;

  const CombinedButtons(this.operation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.69,
        child: GridView.count(
          shrinkWrap: true,
          clipBehavior: ,
          crossAxisCount: 4,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          children: [
            Buttons(ButtonNameEnum.allClear, operation),
            Buttons(ButtonNameEnum.clear, operation),
            Buttons(ButtonNameEnum.percentage, operation),
            Buttons(ButtonNameEnum.divide, operation),
            Buttons(ButtonNameEnum.seven, operation),
            Buttons(ButtonNameEnum.eight, operation),
            Buttons(ButtonNameEnum.nine, operation),
            Buttons(ButtonNameEnum.multiply, operation),
            Buttons(ButtonNameEnum.four, operation),
            Buttons(ButtonNameEnum.five, operation),
            Buttons(ButtonNameEnum.six, operation),
            Buttons(ButtonNameEnum.minus, operation),
            Buttons(ButtonNameEnum.one, operation),
            Buttons(ButtonNameEnum.two, operation),
            Buttons(ButtonNameEnum.three, operation),
            Buttons(ButtonNameEnum.plus, operation),
            Buttons(ButtonNameEnum.convert, operation),
            Buttons(ButtonNameEnum.zero, operation),
            Buttons(ButtonNameEnum.decimal, operation),
            Buttons(ButtonNameEnum.equal, operation),
          ],
        ),
      ),
    );
  }
}