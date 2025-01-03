import 'dart:convert';

String getBasicAuthHeader(String username, String password) {
  return 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
}
