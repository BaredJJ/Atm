import '../web/lib/IBill.dart';

class FakeBill implements IBill{

  int _value;

  FakeBill(int value){
    _value = value;
  }

  int get Value => _value;

  bool Equals(IBill bill) {

    return bill.Value == Value;
  }

  int Cash(int count) => _value * count;

  int Change(int cash) => cash % _value;

  int CountBill(int cash) => (cash / _value).toInt();
}