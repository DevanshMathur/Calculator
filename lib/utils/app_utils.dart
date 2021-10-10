import 'enum/button_name_enum.dart';

class AppUtils {
  static String getButtonText(ButtonNameEnum buttonName) {
    if (buttonName.index < 10) {
      return buttonName.index.toString();
    } else {
      switch (buttonName) {
        case ButtonNameEnum.plus:
          return "+";
        case ButtonNameEnum.minus:
          return "-";
        case ButtonNameEnum.multiply:
          return "X";
        case ButtonNameEnum.divide:
          return "/";
        case ButtonNameEnum.percentage:
          return "%";
        case ButtonNameEnum.equal:
          return "=";
        case ButtonNameEnum.allClear:
          return "AC";
        case ButtonNameEnum.clear:
          return "C";
        case ButtonNameEnum.convert:
          return "S";
        case ButtonNameEnum.decimal:
          return ".";
        default:
          return "";
      }
    }
  }
}
