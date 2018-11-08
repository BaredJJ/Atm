import 'package:angular/angular.dart';
import 'package:Atm/app_component.template.dart' as ng;
import 'dart:html';

void main() {
  //runApp(ng.AppComponentNgFactory);
  var values = GetListBoxValues();

  for(int i = 0; i < values.length; i++)
    {
      var option = GetOption(values[i]);
      querySelector("#first_select_id").appendHtml(option);
    }

  var clickEvent = new ButtonClicEvent();
  querySelector("#button_id").onClick.listen((e) => clickEvent.ButtonClick());
}

String GetOption(int value)=> "<option>" + value.toString() + "</option>";

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

