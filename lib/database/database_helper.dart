
import 'package:path/path.dart';
import 'package:projekt_lab_mobilne/models/game.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static Database? database;

  // otwieranie bazy danych
  static Future<Database> getDatabase() async {

    if (database != null) {
      return database!;
    }

    String databasePath = join(
      await getDatabasesPath(),
      'games_list.db',
    );

    database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE games ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'title TEXT, '
              'platform TEXT, '
              'price REAL'
              ')',
        );
      },
    );

    return database!;
  }

  // dodawanie gry
  static Future<void> insertGame(Game game) async {
    Database db = await getDatabase();

    await db.insert(
      'games',
      game.toMap(),
    );
  }

  // pobieranie wszystkich gier
  static Future<List<Game>> getGames() async {
    Database db = await getDatabase();

    List<Map<String, dynamic>> gamesList = await db.query('games');

    List<Game> games = [];

    for (var game in gamesList) {
      games.add(Game.fromMap(game));
    }

    return games;
  }

  // edytowanie gry
  static Future<void> updateGame(Game game) async {
    Database db = await getDatabase();

    await db.update(
      'games',
      game.toMap(),
      where: 'id = ?',
      whereArgs: [game.id],
    );
  }

  // usuwanie gry
  static Future<void> deleteGame(int id) async {
    Database db = await getDatabase();

    await db.delete(
      'games',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
