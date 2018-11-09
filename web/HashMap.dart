import 'dart:html';
import 'HashCode.dart';

class HashMap{
  List<HashCode> _map;
  List<int> _selectedElement;

  HashMap(List<HashCode> map){
    _map = map;
    _selectedElement = new List<int>();
  }

  List<int> get Selected => _selectedElement;
  int get Count => _selectedElement.length;

  void AddSelected(Event e){
    var index = _getIndex(e.currentTarget.hashCode);
    if(index == -1) return;
    var value = _map.elementAt(index);

    if(!_selectedElement.contains(value.Value))
      _selectedElement.add(value.Value);

  }

  int _getIndex(int hasCode){
    for(int i = 0; i < _map.length; i++)
      if(_map[i].Code == hasCode)
        return i;

      return -1;
  }
}