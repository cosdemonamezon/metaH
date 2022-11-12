import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:metah/models/user.dart';

class ActivityService{
  const ActivityService();

  static Future getUserByCode(String id) async{
    final token = 'fcc68ad5c8d09287e94542098f21c350';
    final headers = {'token': '$token'};
    final body = {"code": id};
    final url = Uri.https('project-h.dev-asha.com','/api/user/get_user_by_code');

    final response = await http.post(url, headers: headers, body: convert.jsonEncode(body));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      //return Guild.fromJson(data['data']);
      return User.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}