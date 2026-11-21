import 'package:flutter/material.dart';
import 'package:projekt_lab_mobilne/database/database_helper.dart';
import 'package:projekt_lab_mobilne/models/game.dart';
import 'package:projekt_lab_mobilne/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  List<Game> games = [];

  @override
  void initState() {
    super.initState();
    loadGames();
  }

  // pobieranie gier z bazy

  Future<void> loadGames() async {
    List<Game> list = await DatabaseHelper.getGames();

    if (list.isEmpty) {
      await DatabaseHelper.insertGame(
        const Game(
          title: 'The Witcher 3',
          platform: 'PC',
          price: 129.99,
        ),
      );

      list = await DatabaseHelper.getGames();
    }

    setState(() {
      games = list;
    });
  }


  // wylogowanie
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()),);
  }

  // lista gier albo napis, gdy lista jest pusta
  Widget buildList() {
    if (games.isEmpty) {
      return const Center(child: Text('No games yet'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: games.length,
      itemBuilder: (context, index) {
        Game game = games[index];

        return Card(
          child: ListTile(
            title: Text(game.title),
            subtitle: Text(game.platform),
            trailing: Text('${game.price} zł'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Games'),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: logout,),
        ],
      ),
      body: buildList(),
    );
  }
}