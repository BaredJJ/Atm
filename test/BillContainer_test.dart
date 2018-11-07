import 'package:test/test.dart';
import '../lib/src/BillContainer.dart';
import 'FakeBill.dart';

void main(){

  test("Construct_Construct_InincilaizeCollection",
      (){
        var billContainer = new BillContainer();

        var isNotNull = (billContainer.Bills != null);

        expect(isNotNull, true);
      });

  test("Construct_Construct_CollectionEmpty",
      (){
        var billContainer = new BillContainer();

        var isEmpty = (billContainer.Count == 0);

        expect(isEmpty, true);
      });

  test("Add_NullArgument_ReturnFalse",
      (){
        var billContainer = new BillContainer();

        var isFalse = billContainer.Add(null);

        expect(isFalse, false);
      });

  test("Add_ValidArgument_ReturnTrue",
      (){
        var billContainer = new BillContainer();
        var fakeBill = new FakeBill(10);

        var isTrue = billContainer.Add(fakeBill);

        expect(isTrue, true);
      });

  test("Add_ValidArgument_CountIncriment",
          (){
        var billContainer = new BillContainer();
        var fakeBill = new FakeBill(10);
        var count= billContainer.Count;

        billContainer.Add(fakeBill);
        count++;

        expect(count, billContainer.Count);
      });

  test("Add_ValidTwoArgumentSameValue_AddOneValue",
          (){
        var billContainer = new BillContainer();
        var fakeBill = new FakeBill(10);
        var secondFakeBill = new FakeBill(10);
        var count= billContainer.Count;

        billContainer.Add(fakeBill);
        billContainer.Add(secondFakeBill);
        count++;

        expect(count, billContainer.Count);
      });
}