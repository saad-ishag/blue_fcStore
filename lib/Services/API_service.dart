import 'dart:convert' show jsonEncode;
import 'package:http/http.dart'as http;

class APIService {

 static const String baseUrl = 'http://api.maydan.club/api/mobile/al-hilal-saudi-fc/';

 Future<http.Response>_get(String url){
  return http.get(Uri.parse(baseUrl + url));

 }

 Future<http.Response> _post(String url ,dynamic bodyMap){
  return http.post(Uri.parse(baseUrl + url ),body: jsonEncode(bodyMap));
 }



}