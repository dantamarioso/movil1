import 'package:mysql1/mysql1.dart';

class Database {
  // Configuración de la conexión a la base de datos
  static final ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'dart_user',
    password: '1234',
    db: 'movil',
  );

  // Método para obtener una conexión a la base de datos
  Future<List<Map<String, dynamic>>> getConnection() async {
    final conn = await MySqlConnection.connect(settings);
    print('Conexión exitosa');
    try {
      var results = await conn.query('SELECT * FROM usuarios');
      return results.map((row) => row.fields).toList();
    } finally {
      await conn.close();
    }
  }
}

void main() async {
  var db = Database();

  try {
    var productos = await db.getConnection();
    print('Usuarios obtenidos:');
    for (var producto in productos) {
      print('$producto');
    }
  } catch (e) {
    print('Error al obtener los usuarios: $e');
  }
}
