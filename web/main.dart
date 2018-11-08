import 'dart:html';
import 'ButtonClickEventHandler.dart';


void main() {

  var clickRadio = new RadioButtonEvent(GetMap());

  querySelector("#one_id").onClick.listen((e) => clickRadio.ButtonClick(e));
  querySelector("#five_id").onClick.listen((e) => clickRadio.ButtonClick(e));
  querySelector("#ten_id").onClick.listen((e) => clickRadio.ButtonClick(e));
  querySelector("#fifteen_id").onClick.listen((e) => clickRadio.ButtonClick(e));
  querySelector("#twenty_id").onClick.listen((e) => clickRadio.ButtonClick(e));
  querySelector("#twenty_five_id").onClick.listen((e) => clickRadio.ButtonClick(e));

  var buttonClick = new ButtonClickEventHandler();
  querySelector("#button_id").onClick.listen((e) => buttonClick.ButtonClick(clickRadio.Selected, clickRadio.Count));

}


Map<int,int> GetMap()
{
  var hashCodes = new Map<int, int>();
  hashCodes.putIfAbsent(querySelector("#one_id").hashCode, () => 1);
  hashCodes.putIfAbsent(querySelector("#five_id").hashCode, () => 5);
  hashCodes.putIfAbsent(querySelector("#ten_id").hashCode, () => 10);
  hashCodes.putIfAbsent(querySelector("#fifteen_id").hashCode, () => 15);
  hashCodes.putIfAbsent(querySelector("#twenty_id").hashCode, () => 20);
  hashCodes.putIfAbsent(querySelector("#twenty_five_id").hashCode, () => 25);

  return hashCodes;
}

class RadioButtonEvent{
  Map<int,int> _map;
  List<int> _selectedElement;

  RadioButtonEvent(Map<int, int> map){
    _map = map;
    _selectedElement = new List<int>();
  }

  List<int> get Selected => _selectedElement;
  int get Count => _selectedElement.length;

  void ButtonClick(Event e){
    var value = _map[e.currentTarget.hashCode];
    if(!_selectedElement.contains(value))
          _selectedElement.add(value);
    querySelector("#my_div_id").appendText(value.toString());
  }
}




