
class HashCode{
  int _hasCodes;
  int _value;

  HashCode(int hasCode, int value){
    _hasCodes = hasCode;
    _value = value;
  }

  int get Code => _hasCodes;

  int get Value => _value;
}