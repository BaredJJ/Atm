import 'package:test/test.dart';
import '../lib/src/IBillContainer.dart';
import 'FakeBill.dart';
import 'package:mockito/mockito.dart';
import '../lib/src/IBill.dart';
import '../lib/src/Atm.dart';

void main(){

  test("Construct_ValidArgument_Construct", (){

    var atm = GetAtm();

    expect(atm, isNotNull);
  });

  test("GetMoney_BadArgument_ReturnEmptyBills", (){
    var atm = GetAtm();

    var money = atm.GetMoney(-1);

    expect(money.length, 0);
  });

  test("GetMoney_ValidArgument_ReturnMoney", (){
    var atm = GetAtm();

    var money = atm.GetMoney(100);

    expect(money.length, isPositive);
  });

  test("GetMoney_ValidArgument_CheckReturnValue", (){
    var atm = GetAtm();

    var money = atm.GetMoney(100);
    var bills = money.keys.toList();
    var countBills = money.values.toList();
    var isBillsTrue = (bills[0].Value == 20 && bills[1].Value == 10 && bills[2].Value == 5 && bills[3].Value == 1);
    var isCountTrue = (countBills[0] == 4 && countBills[1] == 1 && countBills[2] == 1 && countBills[3] == 5);
    var result = isBillsTrue && isCountTrue;

    expect(result, true);
  });
}

class FakeBillContainer extends Mock implements IBillContainer{}

Atm GetAtm() => new Atm(GetBillContainer());

IBillContainer GetBillContainer(){
  var bills = GetBills();
  var billContainer = FakeBillContainer();

  when(billContainer.Bills).thenReturn(bills);
  when(billContainer.Count).thenReturn(bills.length);

  return billContainer;
}

List<IBill> GetBills(){
  var bills = new List<IBill>();

   bills.add(new FakeBill(20));
   bills.add(new FakeBill(10));
   bills.add(new FakeBill(5));
   bills.add(new FakeBill(1));

   return bills;
}
