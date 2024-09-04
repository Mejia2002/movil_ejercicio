import 'package:movil_ejercicio/movil_usuario.dart';
import 'package:movil_ejercicio/movil_funciones.dart';

void main() async {
  try {
    List<User> users = await fetchUsers();
    filterUsersByUsername(users);
    countEmailsWithBizDomain(users);
  } catch (e) {
    print('Error: $e');
  }
}
