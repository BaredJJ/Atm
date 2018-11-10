import 'IBillContainer.dart';
import 'IBill.dart';

class Atm{

  IBillContainer _billContainer;
  int _cash;
  int _MaxValue = 2147483647;

  Atm(IBillContainer billContainer){
    if(billContainer == null)
      throw new ArgumentError(billContainer);

    _billContainer = billContainer;
  }

  //todo нужен рефакторинг
  Map<IBill, int> GetMoney(int cash){

    var maxBills = new Map<IBill, int>();
    int tempChange = _MaxValue;

    for(int k = 0; k < _billContainer.Count; k++) {

      var bills = _getBills(k, cash);

      if(bills.length > maxBills.length || (_cash >= 0 && _cash < tempChange && bills.length == maxBills.length)){
        maxBills = bills;
        tempChange = _cash;
      }
    }

    return maxBills;
  }


  Map<IBill, int> _getBills(int startIndex,  int cash){
    var bills = new Map<IBill, int>();
    _cash = cash;

    for (int i = startIndex; i < _billContainer.Count; i++) {
      var bill = _billContainer.Bills[i];
      if (bill.Value > cash) break;

      cash -= bill.Value;
      bills.putIfAbsent(bill, () => 1);
    }

    bills = _fillCountBills(bills, cash);
    return bills;
  }

  Map<IBill, int> _fillCountBills(Map<IBill, int> bills, int cash){

    if(bills.length < 1) return bills;

    var billsList = bills.keys.toList();
    if(cash > 0 && cash >= billsList[billsList.length - 1].Value){

      for(int i = 0; i < billsList.length; i++)
        if(cash >= billsList[i].Value){
          bills[billsList[i]] += billsList[i].CountBill(cash);
          cash = billsList[i].Change(cash);
        }
    }

    _cash = cash;
    return bills;
  }

}