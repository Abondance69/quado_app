import 'package:flutter/material.dart';
/* 
  Dismissible
  Le widget Dismissible dans Flutter est utilisé pour créer des éléments interactifs dans une liste qui peuvent être glissés horizontalement pour être supprimés.

  Propriétés :
  -key : Propriété requise. Définit une clé unique pour le widget Dismissible. Cela est essentiel pour garantir la stabilité du widget lors de la reconstruction de l'interface utilisateur.
  -child : Propriété requise. Définit le contenu principal du widget Dismissible, généralement un ListTile ou un autre widget contenant les informations à afficher.
  -background : Propriété optionnelle. Définit le contenu à afficher derrière le child lorsque le Dismissible est glissé dans la direction spécifiée par direction.
  -secondaryBackground (Widget) : Propriété optionnelle. Définit le contenu à afficher derrière le child lorsque le Dismissible est glissé dans la direction opposée à celle spécifiée par direction.

  -confirmDismiss (Future<bool> Function(DismissDirection)) : Propriété optionnelle. Une fonction qui est appelée lorsque le Dismissible est complètement glissé.
  -onDismissed : Propriété optionnelle. Une fonction qui est appelée après que le Dismissible a été complètement glissé et confirmé pour la suppression.
  -direction : Propriété optionnelle. Définit la direction dans laquelle le Dismissible peut être glissé pour être supprimé.
  -resizeDuration (Duration) : Propriété optionnelle. La durée de l'animation de redimensionnement lorsqu'un Dismissible est supprimé. Par défaut, elle est de 300 millisecondes.

  -movementDuration (Duration) : Propriété optionnelle. La durée de l'animation de mouvement lorsque le Dismissible est glissé. Par défaut, elle est de 200 millisecondes.
  -backgroundShape (ShapeBorder) : Propriété optionnelle. La forme du widget d'arrière-plan du Dismissible. Par défaut, elle est un rectangle.
  -secondaryBackgroundShape (ShapeBorder) : Propriété optionnelle. La forme du widget d'arrière-plan lorsque le Dismissible est glissé dans la direction opposée.
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  List<String> students = ['Voldi', 'Anderson', 'Divin', 'Simeon', 'David'];
  List<IconData> studentImages = [Icons.person_2, Icons.favorite, Icons.wallet, Icons.settings, Icons.home]; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dismissible(
                  key: Key(students[index]), 
                  direction: DismissDirection.startToEnd,
                  background: removeBackground(),
                  movementDuration: const Duration(seconds: 5),
                  resizeDuration: const Duration(seconds: 5),
                  child: myListeTile(index),
                  onDismissed: (direction) {
                    setState(() {
                      students.removeAt(index);
                      // students.removeWhere((element) => element == students[index]);
                      // print(direction);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  IconData getResult(element) {
    late IconData icon;
    icon = (element.length % 2 == 0)? Icons.done : Icons.close;
    return icon;
  }

  void showSnackBar(name) {
    dynamic snackbar = SnackBar(
      content: Text("Bonjour $name, tu est un génie"),
      backgroundColor: Colors.teal,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  ListTile myListeTile(index) {
    return ListTile(
      leading: Icon(studentImages[index]),
      title: Text(
        "${index + 1} ${students[index]}",
      ),
      subtitle: const Text("Les meilleurs élèves de l'école"),
      trailing: Icon(getResult(students[index])),
      tileColor: Colors.greenAccent,
      onTap: () => showSnackBar(students[index]),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container removeBackground() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Supprimer cet élément',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
