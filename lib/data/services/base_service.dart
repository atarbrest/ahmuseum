import 'package:http/http.dart' as http;

abstract class BaseService {
  final http.Client client = http.Client();
}
