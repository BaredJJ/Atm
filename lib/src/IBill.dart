abstract class IBill{
  int get Value;

  int Cash(int count);

  int Change(int cash);

  int CountBill(int cash);

  bool Equals(IBill bill);
}