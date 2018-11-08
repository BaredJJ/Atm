import 'package:test/test.dart';
import '../web/lib/Bill.dart';

void main(){
  test('Construct_ValidArgument_SetProperties', ()
    {
      var bill = new Bill(1);

      expect(bill.Value, 1);
    }
  );

  test("Equals_SameValueInstances_ReturnTrue", (){

    var bill = new Bill(10);
    var secondBill = new Bill(10);

    var result = bill.Equals(secondBill);

    expect(result, true);
  });

  test("Equals_ArgumentNull_ReturnFalse", (){

    var bill = new Bill(10);

    var result = bill.Equals(null);

    expect(result, false);
  });

  test("Equals_DiffeerentArguments_ReturnFalse", (){

    var bill = new Bill(10);
    var secondBill = new Bill(1);

    var result = bill.Equals(secondBill);

    expect(result, false);
  });

  test("Cash_BadArgument_ReturnZero", (){
    var bill = new Bill(10);

    expect(bill.Cash(-1), 0);
  });

  test("Cash_ValidArgument_ReturnMultiply", (){
    var bill = new Bill(10);
    int val = 10;
    int standard = bill.Value * val;

    expect(bill.Cash(val), standard);
  });

  test("Change_ValidArgument_ReturnChange", (){
    var bill = new Bill(10);
    int val = 10;
    int standard = val % bill.Value;

    expect(bill.Change(val), standard);
  });

  test("Change_BadArgument_ReturnZero", (){
    var bill = new Bill(10);
    int val = 0;

    expect(bill.Change(val), 0);
  });

  test("CountBill_ValidArgument_ReturnCount", (){
    var bill = new Bill(10);
    int val = 10;
    int standard = (val / bill.Value).toInt();

    expect(bill.CountBill(val), standard);
  });

  test("Change_BadArgument_ReturnZero", (){
    var bill = new Bill(10);
    int val = 0;

    expect(bill.CountBill(val), 0);
  });

}