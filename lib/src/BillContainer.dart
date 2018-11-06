import 'IBillContainer.dart';
import 'IBill.dart';

class BillContainer implements IBillContainer{

  List<IBill> _bills;

  BillContainer(){
    _bills = new List<IBill>();
  }

  List<IBill> get Bills => _bills;

  int get Count => _bills.length;

  bool Add(IBill bill)
  {
    if(bill == null) return false;
    if(Contains(bill)) return false;

    _bills.add(bill);
    return true;
  }

  bool Contains(IBill bill){
    for(int i = 0; i < Count; i++)
      if(_bills[i].Equals(bill))
        return true;

      return false;
  }
}