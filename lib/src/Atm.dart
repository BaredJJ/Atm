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

    var money = new Map<IBill,int>();
    var length = _billContainer.Count;

    for(int i = 0; i < length; i++)
      {
        var bill = _billContainer.Bills[i];
        if(bill.Value > cash) continue;

        var countBills = bill.CountBill(cash);
        if(bill.Change(cash) == 0 && i != length - 1)
          {
            if(countBills == 0 &&  money.length == 0) continue;

            countBills--;
          }

        cash -= bill.Cash(countBills);

        if(countBills > 0)
          money.putIfAbsent(bill, () => countBills);
      }

      return money;
  }
  
}