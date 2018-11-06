import '../lib/src/IBill.dart';

class FakeBill implements IBill{

  int _value;

  FakeBill(int value){
    _value = value;
  }

  int get Value => _value;

  bool Equals(IBill bill) {

    return bill.Value == Value;
  }
}