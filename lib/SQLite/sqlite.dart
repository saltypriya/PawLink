import 'package:pawlink/JsonModels/pet.dart';
import 'package:pawlink/JsonModels/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final databaseName = "pawlink.db";

  // Table creation queries
  String usersTable =
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";

  String petsTable =
      "CREATE TABLE pets (petId INTEGER PRIMARY KEY AUTOINCREMENT, petName TEXT, species TEXT, breed TEXT, age INTEGER, gender TEXT, color TEXT, weight REAL, healthIssues TEXT, medications TEXT, feedingInstructions TEXT, exerciseNeeds TEXT, groomingRequirements TEXT, microchipId TEXT, userId INTEGER, FOREIGN KEY (userId) REFERENCES users(usrId))";

  // Method to initialize the database
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(usersTable);
      await db.execute(petsTable);
    });
  }

  // Method to authenticate user login
  Future<bool> login(Users user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "SELECT * FROM users WHERE usrName = ? AND usrPassword = ?",
        [user.usrName, user.usrPassword]);
    return result.isNotEmpty;
  }

  // Method to register a new user
  Future<int> signup(Users user) async {
    final Database db = await initDB();
    return db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Method to save pet information
  Future<int> savePet(Pet pet, int userId) async {
    final Database db = await initDB();
    Map<String, dynamic> petData = pet.toMap();
    petData['userId'] = userId;
    return db.insert('pets', petData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Method to retrieve pets associated with a specific user
  Future<List<Pet>> getPetsForUser(int userId) async {
    final Database db = await initDB();
    var result = await db.query('pets', where: 'userId = ?', whereArgs: [userId]);
    return result.map((json) => Pet.fromJson(json)).toList();
  }
}
