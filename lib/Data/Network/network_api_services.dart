import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';
import 'package:provider_class_3/Data/Network/base_api_services.dart';
import 'package:provider_class_3/Data/app_exception.dart';

class NetworkApiservices extends BaseApiservices{
  @override
  Future getGetApiResponse(String uri) async {
   dynamic responseJSON;
 try{

   var response=await http.get(Uri.parse(uri)).timeout(Duration(seconds: 10));
       responseJSON=returnResponse(response);
 }on SocketException{

   throw FetchDataException("No Internet Connection");

 }
  return responseJSON;
  }

  @override
  Future getPostApiResponse(String uri,dynamic data) async {
    dynamic responseJSON;
    try{

      Response response=await post(Uri.parse(uri),body: data).timeout(Duration(seconds: 10));
      responseJSON=returnResponse(response);
    }on SocketException{

      throw FetchDataException("No Internet Connection");

    }
    return responseJSON;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:dynamic responseJson=jsonDecode(response.body);
      return responseJson;
      case 400: BadRequestException(response.body);
      case 500:
      case 404: UnauthuriseException(response.body);
      default:throw FetchDataException("error accured while communication with server "+response.statusCode.toString());
    }

  }
}
