import 'package:test/test.dart';
import '../lib/src/Bill.dart';

void main(){
  test('Construct_ValidArgument_SetProperties', ()
    {
      var bill = new Bill(1);

      expect(bill.Value, 1);
    }
  );

  //test('Construct_BadValue_ThrowException', ()
  //  {
  //    expect(new Bill(-1), new ArgumentError(-1) );
  //  }
  //);
}