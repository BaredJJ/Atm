import 'package:test/test.dart';
import '../web/lib/IBillContainer.dart';
import 'FakeBill.dart';
import 'package:mockito/mockito.dart';
import '../web/lib/IBill.dart';
import '../web/lib/Atm.dart';

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

  test("GetMoney_ValidArgument_ReturnFiveBills", (){
    var atm = GetAtmDifferentBills(GetSevenBills());

    var money = atm.GetMoney(100);
    var bills = money.keys.toList();
    var countBills = money.values.toList();
    var isBillsTrue = (bills[0].Value == 50 && bills[1].Value == 25 && bills[2].Value == 10 && bills[3].Value == 5 && bills[4].Value == 1);
    var isCountTrue = (countBills[0] == 1 && countBills[1] == 1 && countBills[2] == 1 && countBills[3] == 2 && countBills[4] == 5);
    var result = isBillsTrue && isCountTrue;

    expect(result, true);
  });

  test("GetMoney_ValidArgument_ReturnSevenBills", (){
    var atm = GetAtmDifferentBills(GetSevenBills());

    var money = atm.GetMoney(1000);
    var bills = money.keys.toList();
    var countBills = money.values.toList();
    var isBillsTrue = (bills[0].Value == 100 && bills[1].Value == 50 && bills[2].Value == 30 && bills[3].Value == 25 && bills[4].Value == 10 && bills[5].Value == 5 && bills[6].Value == 1);
    var isCountTrue = (countBills[0] == 8 && countBills[1] == 2 && countBills[2] == 1 && countBills[3] == 2 && countBills[4] == 1 && countBills[5] == 1 && countBills[6] == 5);
    var result = isBillsTrue && isCountTrue;

    expect(result, true);
  });

  test("GetMoney_ValidArgument_ReturnOneBills", (){
    var atm = GetAtmDifferentBills(GetTwoBills());

    var money = atm.GetMoney(40);
    var bills = money.keys.toList();
    var countBills = money.values.toList();
    var isBillsTrue = (bills[0].Value == 20);
    var isCountTrue = (countBills[0] == 2);
    var result = isBillsTrue && isCountTrue;

    expect(result, true);
  });

  test("GetMoney_ValidArgument_CheckOneValue", (){
    var atm = GetAtm();

    var money = atm.GetMoney(1);
    var bills = money.keys.toList();
    var countBills = money.values.toList();
    var isBillsTrue = (bills[0].Value == 1);
    var isCountTrue = (countBills[0] == 1);
    var result = isBillsTrue && isCountTrue;

    expect(result, true);
  });
}

class FakeBillContainer extends Mock implements IBillContainer{}

Atm GetAtm() => new Atm(GetBillContainer(GetBills()));

Atm GetAtmDifferentBills(List<IBill> bills) => new Atm(GetBillContainer(bills));

IBillContainer GetBillContainer(List<IBill> bills){
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

List<IBill> GetSevenBills(){
  var bills = new List<IBill>();

   bills.add(new FakeBill(100));
   bills.add(new FakeBill(50));
   bills.add(new FakeBill(30));
   bills.add(new FakeBill(25));
   bills.add(new FakeBill(10));
   bills.add(new FakeBill(5));
   bills.add(new FakeBill(1));

   return bills;
}

List<IBill> GetTwoBills(){
  var bills = new List<IBill>();

   bills.add(new FakeBill(25));
   bills.add(new FakeBill(20));

   return bills;
}

List<IBill> GetFourBills(){
  var bills = new List<IBill>();

   bills.add(new FakeBill(25));
   bills.add(new FakeBill(20));
   bills.add(new FakeBill(15));
   bills.add(new FakeBill(1));

   return bills;
}

