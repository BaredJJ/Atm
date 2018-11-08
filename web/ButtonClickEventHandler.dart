import 'dart:html';
import './lib/BillContainer.dart';
import './lib/Bill.dart';
import './lib/Atm.dart';
import 'dart:js';

class ButtonClickEventHandler{
  void ButtonClick(List<int> values, int length) {
    if(length < 2) return;


    var billContainer = new BillContainer();
    values.sort();
    for(int i = values.length - 1; i >= 0; i--) {
      var bill = new Bill(values[i]);
      billContainer.Add(bill);
    }

    var atm = new Atm(billContainer);
    AtmWorked(atm);
  }

  String _warning = "Please, enter number more zero";

  void AtmWorked(Atm atm){
    while(true){
      String result = context.callMethod('prompt', ['Please, enter cash']);
      var value = int.tryParse(result);
      if(value is int)
        {
          if(value > 0) {
            var money = atm.GetMoney(value);
            var keys = money.keys.toList();
            var values = money.values.toList();
            String message = '';
            for (int i = 0; i < keys.length; i++)
              message += "Bill: " + keys[i].toString() + " - " + "Count: " +
                  values[i].toString() + "\n";

            context.callMethod('alert', [message]);
          }
          else context.callMethod('alert',[_warning]);
        }
      else  context.callMethod('alert',[_warning]);
    }
  }
}