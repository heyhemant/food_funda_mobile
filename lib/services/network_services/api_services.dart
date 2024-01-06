import 'package:dio/dio.dart';
import 'package:food_funda_business/services/network_services/api_constants.dart';

abstract class IApiServices {
  Future<Response> postRequest(String url, Map<String, dynamic> data);
  Future<Response> getRequest(String url, Map<String, dynamic> data);
  Future<Response> putRequest(String url, Map<String, dynamic> data);
  Future<Response> deleteRequest(String url, Map<String, dynamic> data);
}
class ApiServices {
  final Dio _dio = Dio();
  
  Future<Response?> getOtp(String mobileNumber)async{
    try{
      FormData formData = FormData.fromMap({
        'mobile_number': mobileNumber,
      });
      Response response = await _dio.get(ApiConstant.BASE_URL+ApiConstant.GENERATE_OTP, data: formData);
      return response;
    }
    catch(e){
      print('error in getOtp $e');
      return null;
    }
  }

  Future<Response?> verifyOtp(String otp)async{
    try{
      FormData formData = FormData.fromMap({
        'otp': otp,
      });
      Response response = await _dio.post(ApiConstant.BASE_URL+ApiConstant.VALIDATE_OTP, data: formData);
      return response;
    }
    catch(e){
      print('error in getOtp $e');
      return null;
    }
  }

  Future<Response?> registerUser(String name, String email, String password, String mobileNumber)async{
    try{
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'mobile_number': mobileNumber,
      });
      Response response = await _dio.post(ApiConstant.BASE_URL+ApiConstant.REGISTER_USER, data: formData);
      return response;
    }
    catch(e){
      print('error in getOtp $e');
      return null;
    }
  }
}
