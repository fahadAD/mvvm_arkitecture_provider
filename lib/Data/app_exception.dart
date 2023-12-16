class AppException implements Exception{
  final _massage;
  final _prefix;
  AppException([this._massage,this._prefix]);
  String toString(){
    return "$_prefix$_massage";
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? massage]) : super(massage,"Error During Communication");
}

class BadRequestException extends AppException{
  BadRequestException([String? massage]) : super(massage,"Invalid Request ");
}
class UnauthuriseException extends AppException{
  UnauthuriseException([String? massage]) : super(massage,"Unauthurise Request");
}

class InvalidInputException extends AppException{
  InvalidInputException([String? massage]) : super(massage,"Invalid Input ");
}

