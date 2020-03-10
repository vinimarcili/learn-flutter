import 'package:bytebank/services/log-client.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

const String _url = 'http://192.168.130.141:4040';

findAll() async {
  final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get(_url + '/transactions');
  return response.body;
}