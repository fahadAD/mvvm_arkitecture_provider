

import 'package:provider_class_3/Data/Network/base_api_services.dart';
import 'package:provider_class_3/Data/Network/network_api_services.dart';
import 'package:provider_class_3/Res/all_urls.dart';

class Authrepository{
  BaseApiservices _apiservices=NetworkApiservices();

  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response=await _apiservices.getPostApiResponse(Appurls.loginUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try{
      dynamic response=await _apiservices.getPostApiResponse(Appurls.registerUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}