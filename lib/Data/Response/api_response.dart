
import 'package:provider_class_3/Data/Response/status.dart';

class ApiResponse<T> {
Status? status;
T? data;
String? massage;

ApiResponse(this.status,this.massage,this.data);
ApiResponse.loading() : status=Status.LOADING;
ApiResponse.complted() : status=Status.COMPLETED;
ApiResponse.error() : status=Status.ERROR;

  @override
  String toString(){
   return "Status : $status \n Massage : $massage \n Data : $data";
}
 }