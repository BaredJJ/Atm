import 'package:angular/angular.dart';
import 'package:Atm/app_component.template.dart' as ng;
import 'dart:html';

void main() {
  runApp(ng.AppComponentNgFactory);

  var values = GetListBoxValues();
  //var listBox = new SelectElement();
  SelectElement listBox = querySelector("#first");

  var keys = values.keys.toList();
  for(int i = 0; i < values.length; i++)
   {
      var data = keys[i].toString();
      var option = new OptionElement();
      option.text = data;
      option.value = data;
      option.selected = false;
     // var option = new Element.html("<option>" + keys[i].toString()+"</option");
      listBox.options.add(option);
      values[keys[i]] = option;
   }


  //container.nodes.add(listBox);
  //container.children.add(listBox);
}

Map<int, OptionElement> GetListBoxValues(){
  var values = new Map<int, OptionElement>();

  for(int i = 2; i < 10; i++)
    values.putIfAbsent(i, () => null);

  return values;
}
