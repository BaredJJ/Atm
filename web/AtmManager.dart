import './lib/BillContainer.dart';
import './lib/Bill.dart';
import './lib/Atm.dart';
import 'dart:js';

class AtmManager{
  String _notSelected = "Please, selected min two radio button";
  String _warning = "Please, enter number more zero";

  void PutMoney(List<int> values, int length) {
    if(length < 2)
      {
        Alert(_notSelected);
        return;
      }

    var billContainer = GetBillContainer(values);
    var atm = new Atm(billContainer);
    StartAtm(atm);
  }

  void StartAtm(Atm atm){
    while(true){
      String result = context.callMethod('prompt', ['Please, enter cash']);
      var value = int.tryParse(result);
      if(value is int && value > 0)
        {
            ShowMoney(atm, value);
        }
      else  Alert(_warning);
    }
  }

  void Alert(String message) => context.callMethod('alert',[message]);

  BillContainer GetBillContainer(List<int> values){
    var billContainer = new BillContainer();

    values.sort();
    for(int i = values.length - 1; i >= 0; i--) {
      var bill = new Bill(values[i]);
      billContainer.Add(bill);
    }

    return billContainer;
  }

  void ShowMoney(Atm atm, int value){
    var money = atm.GetMoney(value);//TODO возможно надо переделать на класс свозвращаемое значение
    var keys = money.keys.toList();
    var values = money.values.toList();
    String message = '';

    for (int i = 0; i < keys.length; i++)
      message += "Bill: " + keys[i].toString() + " - " + "Count: " +
          values[i].toString() + "\n";

    Alert(message);
  }
}