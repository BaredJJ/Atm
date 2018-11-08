import 'IBill.dart';

abstract class IBillContainer{
  List<IBill> get Bills;

  int get Count;
}