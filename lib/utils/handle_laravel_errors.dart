import 'package:dio/dio.dart';
import 'package:flutter_locyin/utils/toast.dart';

void handleLaravelErrors(DioError error){
  if(error.response!.data['message'] != null && error.response!.data['errors']==null){
    ToastUtils.error(error.response!.data['message']);
  }else{
    for (var value in error.response!.data['errors'].values) {
      //print(key);
      ToastUtils.error(value[0]);
    }
  }
}