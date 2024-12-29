import 'package:dio/dio.dart';
import 'package:security_project/utils/constants/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TMultiMediaHelper {
  static final TMultiMediaHelper _instance = TMultiMediaHelper._internal();
  late Dio dio;

  factory TMultiMediaHelper() {
    return _instance;
  }

  TMultiMediaHelper._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: TApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger(requestBody: true, error: true, requestHeader: true));
  }

  Future<Map<String, dynamic>> uploadFile({
    required Map<String, dynamic> data,
    required List<int> fileBytes,
    required String fileName,
    required String endPoint,
    required String token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      };

      FormData formData = _createFormData(data, fileBytes, fileName);

      Response response = await dio.post(endPoint, data: formData);

      return _handleResponse(response);
    } catch (error) {
      if (error is DioError) {
        if (error.response != null) {
          throw Exception(
              "DioError: ${error.response?.statusCode} - ${error.response?.data}");
        } else {
          throw Exception("DioError: ${error.message}");
        }
      } else {
        rethrow;
      }
    }
  }

  FormData _createFormData(Map<String, dynamic> data, List<int> fileBytes, String fileName) {
    MultipartFile multipartFile = MultipartFile.fromBytes(
      fileBytes,
      filename: fileName,
    );
    return FormData.fromMap({
      ...data,
      "file": multipartFile,
    });
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception(
          "Failed with status code: ${response.statusCode}, Message: ${response.statusMessage}");
    }
  }
}
