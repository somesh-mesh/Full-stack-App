import 'package:chopper/chopper.dart';
import 'package:chopper_built_value/chopper_built_value.dart';
import 'package:full_stack_social_app/bussinessLogic/models/serializers.dart';
import 'package:full_stack_social_app/main.dart';
import 'package:http/io_client.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService<T> extends ChopperService {
  static ApiService create() {
    IOClient httpClient = IOClient();

    final client = ChopperClient(
        client: httpClient,
        baseUrl: Uri.parse(Environment.baseUrl),
        interceptors: [
          authHeaderInterceptor,
          HttpLoggingInterceptor(),
        ],
        converter: BuiltValueConverter(serializers),
        errorConverter: BuiltValueConverter(serializers),
        services: [_$ApiService()]);

    return _$ApiService(client);
  }

  static Future<Request> authHeaderInterceptor(Request request) async {
    Map<String, String> headers = Map<String, String>.from(request.headers);
    request = request.copyWith(headers: headers);
    return request;
  }
}
