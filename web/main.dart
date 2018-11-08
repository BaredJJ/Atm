import 'package:angular/angular.dart';
import 'package:Atm/app_component.template.dart' as ng;
import 'dart:html';



void main() {
  //runApp(ng.AppComponentNgFactory);
  var values = GetListBoxValues();
  var selection = Element.select();
  selection.onChange.listen((e) => querySelector("#my_div_id").appendText(selection.text));

  for(int i = 0; i < values.length; i++)
    {
      var optionTest = Element.option();
      optionTest.text = values[i].toString();
      selection.append(optionTest);
    }

  querySelector("#my_div_id").append(selection);
  var clickEvent = new ButtonClicEvent();
  querySelector("#button_id").onClick.listen((e) => clickEvent.ButtonClick());
}



List<int> GetListBoxValues() {
  var values = new List<int>();

  for (int i = 2; i < 10; i++)
    values.add(i);

  return values;
}

class ButtonClicEvent {
  void ButtonClick() {
    querySelector("#my_div_id").appendText("Yap yap");
  }
}

