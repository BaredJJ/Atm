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
    var lenght = _billContainer.Count;

    for(int i = 0; i < lenght; i++)
      {
        var bill = _billContainer.Bills[i];
        if(bill.Value > cash) continue;

        var count = 0;
        if(cash % bill.Value == 0 && i != lenght - 1 && money.length == 0)
          {
            var temp = ((cash / bill.Value) - 1).toInt();
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