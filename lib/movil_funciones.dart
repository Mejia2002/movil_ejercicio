import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movil_usuario.dart'; 

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

void filterUsersByUsername(List<User> users) {
  var filteredUsers = users.where((user) => user.username.length > 6).toList();
  filteredUsers.forEach((user) => print(user.username));
}

void countEmailsWithBizDomain(List<User> users) {
  int count = users.where((user) => user.email.endsWith('.biz')).length;
  print('Número de usuarios con dominio .biz: $count');
}
