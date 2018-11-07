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

        var count = 0;
        if(cash % bill.Value == 0 && i != length - 1)
          {
            var temp = ((cash / bill.Value) - 1).toInt();
            if(temp == 0 &&  money.length == 0) continue;
            cash -= bill.Value * temp;//TODO Дубляж
            count = temp;
          }
        else
          {
            var temp = (cash / bill.Value).toInt();
            cash -= bill.Value * temp;//TODO Дубляж
            count = temp;
          }

        if(count > 0)
          money.putIfAbsent(bill, () => count);
      }

      return money;
  }
}