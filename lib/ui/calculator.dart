import 'package:calculator/ui/widget/custom_app_bar.dart';
import 'package:calculator/utils/enum/button_name_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

import 'widget/combined_buttons.dart';

class Calculator extends StatefulWidget {
  const Calculator({key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  String expression = "";
  bool showResult = false;
  bool isDouble = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: const CustomAppBar("Calculator"),
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            40,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                expression,
                softWrap: true,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: showResult
                  ? Text(
                      result,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  : Container(),
            ),
            CombinedButtons(operation),
          ],
        ),
      ),
    );
  }

  void operation(ButtonNameEnum buttonName) {
    setState(() {
      if (buttonName.index < 10) {
        expression += buttonName.index.toString();
        if (isDouble) {
          result = Parser()
              .parse(expression)
              .evaluate(EvaluationType.REAL, ContextModel())
              .toString();
        } else {
          result = Parser()
              .parse(expression)
              .evaluate(EvaluationType.REAL, ContextModel())
              .round()
              .toString();
        }
      } else if (expression.isNotEmpty) {
        showResult = true;
        if (num.tryParse(expression[expression.length - 1]) == null &&
            buttonName != ButtonNameEnum.clear) {
          expression = expression.substring(0, expression.length - 1);
        }
        switch (buttonName) {
          case ButtonNameEnum.plus:
            expression += "+";
            break;
          case ButtonNameEnum.minus:
            expression += "-";
            break;
          case ButtonNameEnum.multiply:
            expression += "*";
            break;
          case ButtonNameEnum.divide:
            expression += "/";
            isDouble = true;
            break;
          case ButtonNameEnum.percentage:
            int ind = 0;
            for (var i in expression.split("")) {
              if (['+', '-', '*', '/'].contains(i)) {
                ind = expression.lastIndexOf(i);
              }
            }

            String exp1 = expression.substring(0, ind);
            String exp2 = expression.substring(ind, ind + 1);
            String exp3 = expression.substring(ind + 1);

            String val1 = Parser()
                .parse(exp1)
                .evaluate(EvaluationType.REAL, ContextModel())
                .toString();

            var val2 = double.parse(exp3.split('%')[0]) / 100;

            expression = exp1 + exp2;
            if (exp2 == '*' || exp2 == '/') {
              expression += val2.toString();
            }
            if (exp2 == '+' || exp2 == '-') {
              var val3 = val2 * double.parse(val1);
              expression += val3.toString();
            }
            result = Parser()
                .parse(expression)
                .evaluate(EvaluationType.REAL, ContextModel())
                .toString();
            isDouble = true;
            break;
          case ButtonNameEnum.equal:
            if (isDouble) {
              result = Parser()
                  .parse(expression)
                  .evaluate(EvaluationType.REAL, ContextModel())
                  .toString();
            } else {
              result = Parser()
                  .parse(expression)
                  .evaluate(EvaluationType.REAL, ContextModel())
                  .round()
                  .toString();
            }
            break;
          case ButtonNameEnum.allClear:
            showResult = false;
            isDouble = false;
            expression = "";
            result = '=0';
            break;
          case ButtonNameEnum.clear:
            expression = expression.substring(0, expression.length - 1);
            if (expression.isEmpty) {
              result = "";
            }
            break;
          case ButtonNameEnum.convert:
            break;
          case ButtonNameEnum.decimal:
            expression += ".";
            break;
          case ButtonNameEnum.zero:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.one:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.two:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.three:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.four:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.five:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.six:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.seven:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.eight:
            // TODO: Handle this case.
            break;
          case ButtonNameEnum.nine:
            // TODO: Handle this case.
            break;
        }
      }
    });
  }
}
