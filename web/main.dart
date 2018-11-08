import 'dart:html';
import 'AtmManager.dart';
import 'HashMap.dart';
import 'HashCode.dart';


void main() {

  var clickRadio = new HashMap(GetMap());

  querySelector("#one_id").onClick.listen((e) => clickRadio.AddSelected(e));
  querySelector("#five_id").onClick.listen((e) => clickRadio.AddSelected(e));
  querySelector("#ten_id").onClick.listen((e) => clickRadio.AddSelected(e));
  querySelector("#fifteen_id").onClick.listen((e) => clickRadio.AddSelected(e));
  querySelector("#twenty_id").onClick.listen((e) => clickRadio.AddSelected(e));
  querySelector("#twenty_five_id").onClick.listen((e) => clickRadio.AddSelected(e));

  var buttonClick = new AtmManager();
  querySelector("#button_id").onClick.listen((e) => buttonClick.PutMoney(clickRadio.Selected, clickRadio.Count));

}


List<HashCode> GetMap()
{
  var hashCodes = new List<HashCode>();
  hashCodes.add(new HashCode(querySelector("#one_id").hashCode,  1));
  hashCodes.add(new HashCode(querySelector("#five_id").hashCode,  5));
  hashCodes.add(new HashCode(querySelector("#ten_id").hashCode,  10));
  hashCodes.add(new HashCode(querySelector("#fifteen_id").hashCode,  15));
  hashCodes.add(new HashCode(querySelector("#twenty_id").hashCode,  20));
  hashCodes.add(new HashCode(querySelector("#twenty_five_id").hashCode,  25));

  return hashCodes;
}






