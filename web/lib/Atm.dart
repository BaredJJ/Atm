import 'IBillContainer.dart';
import 'IBill.dart';

class Atm{

  IBillContainer _billContainer;

  Atm(IBillContainer billContainer){
    if(billContainer == null)
      throw new ArgumentError(billContainer);

    _billContainer = billContainer;
  }

  //todo нужен рефакторинг
  Map<IBill, int> GetMoney(int cash){

    var bills = _getMaxBill(cash);
    var moneys = new Map<IBill, int>();

    for(int i = 0; i < _billContainer.Count; i++){
      for(int k = 0; k < bills.length; k++)
      {
        var bill = _billContainer.Bills[i];
        if(bill != bills[k]) continue;
        var countBill = 0;

        while(true){
          if(k == bills.length - 1){
            countBill = bills[k].CountBill(cash);
            break;
          }

          var count = _getCountOnNextStep(bills, cash - bill.Value);
          if(bills.length - k - 1 > count ) break;

          cash -= bill.Value;//todo дубляж
          countBill++;
        }

        moneys.putIfAbsent(bill, () => countBill);
      }
    }

    return moneys;
  }

  List<IBill> _getMaxBill(int cash){

    var maxBills = new List<IBill>();
    for(int k = 0; k < _billContainer.Count; k++) {

      var bills = _getCountBills(k, cash);

      if(bills.length > maxBills.length)
        maxBills = bills;
    }

    return maxBills;
  }

  List<IBill> _getCountBills(int startIndex, int cash){
    var bills = new List<IBill>();

    for (int i = startIndex; i < _billContainer.Count; i++) {
      var bill = _billContainer.Bills[i];
      if (bill.Value > cash) break;

      cash -= bill.Value;
      bills.add(bill);
    }

    return bills;
  }

  int _getCountOnNextStep(List<IBill> bills, int cash){
    var count = 0;

    for(int i = 0; i < bills.length; i++) {
      if (bills[i].Value < cash) {
        cash -= bills[i].Value; //todo дубляж
        count++;
      }
    }

    return count;
  }

}