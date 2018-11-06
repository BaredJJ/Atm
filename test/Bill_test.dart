import 'package:test/test.dart';
import '../lib/src/Bill.dart';

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

  //test('Construct_BadValue_ThrowException', ()
  //  {
  //    expect(new Bill(-1), new ArgumentError(-1) );
  //  }
  //);
}