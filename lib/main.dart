import 'package:mysql1/mysql1.dart';

class Database {
  // Configuración de la conexión a la base de datos
  static final ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'dart_user',
    password: '1234',
    db: 'inversiones',
  );

  // Método para obtener una conexión a la base de datos
  Future<void> testConnection() async {
    try {
      final conn = await MySqlConnection.connect(settings);
      print('Conexión exitosa a la base de datos');
      await conn.close();
    } catch (e) {
      print('Error al conectar a la base de datos: $e');
    }
  }
}

void main() async {
  var db = Database();
  await db.testConnection();
}
