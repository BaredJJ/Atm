import 'IBill.dart';

class Bill implements IBill{

  int _value;

  Bill(int value){
    if(value < 1)
      throw new ArgumentError(value);

    _value = value;
  }

  int get Value => _value;

  int Cash(int count) => (count < 1) ? 0 : _value * count;

  int Change(int cash) => (cash < 1) ? 0 : cash % _value;

  int CountBill(int cash) => (cash < 1) ? 0 : (cash / _value).toInt();

  bool Equals(IBill bill){
    if(bill == null) return false;
    var castBill = bill as Bill;
    if(castBill == null) return false;

    return castBill.Value == Value;
  }
}