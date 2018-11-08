import 'IBillContainer.dart';
import 'IBill.dart';

class Atm{

  IBillContainer _billContainer;

  Atm(IBillContainer billContainer){
    if(billContainer == null)
      throw new ArgumentError(billContainer);

    _billContainer = billContainer;
  }


  Map<IBill, int> GetMoney(int cash){

    var bills = GetMaxBill(cash);
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

          var count = CountOnNextStep(bills, cash - bill.Value);
          if(bills.length - k - 1 > count ) break;

          cash -= bill.Value;
          countBill++;
        }

        moneys.putIfAbsent(bill, () => countBill);
      }
    }

    return moneys;
  }

  List<IBill> GetMaxBill(int cash){

    var maxBills = new List<IBill>();
    for(int k = 0; k < _billContainer.Count; k++) {

      var bills = new List<IBill>();
      for (int i = k; i < _billContainer.Count; i++) {
        var bill = _billContainer.Bills[i];
        if (bill.Value > cash) break;

        cash -= bill.Value;
        bills.add(bill);
      }

      if(bills.length > maxBills.length)
        maxBills = bills;
    }

    return maxBills;
  }

  int CountOnNextStep(List<IBill> bills, int cash){
    var count = 0;

    for(int i = 0; i < bills.length; i++)
      if(bills[i].Value < cash)
        {
          cash -= bills[i].Value;
          count++;
        }
    return count;
  }

}