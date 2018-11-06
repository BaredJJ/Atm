import 'IBill.dart';

class Bill implements IBill{

  int _value;

  Bill(int value){
    if(value < 1)
      throw new ArgumentError(value);

    _value = value;
  }

  int get Value => _value;

  bool Equals(IBill bill){
    if(bill == null) return false;
    var castBill = bill as Bill;
    if(castBill == null) return false;

    return castBill.Value == Value;
  }
}