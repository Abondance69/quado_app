import 'package:flutter/material.dart';
/* 
  Gridview
  Le widget GridView dans Flutter est utilisé pour afficher une grille bidimensionnelle d'éléments. Il est souvent utilisé pour afficher des listes d'éléments où chaque élément peut être différent, comme des images, du texte, etc.

  Propriétés :
  -children : Propriété requise. Elle spécifie la liste des widgets à afficher dans la grille.
  -gridDelegate (SliverGridDelegate) : Propriété requise. Elle définit la mise en page de la grille. Vous pouvez utiliser SliverGridDelegateWithFixedCrossAxisCount pour une grille avec un nombre fixe d'éléments par ligne ou SliverGridDelegateWithMaxCrossAxisExtent pour spécifier la taille maximale des éléments.
  -itemBuilder (BuildContext, int) : La fonction appelée pour construire chaque élément de la grille. Prend deux paramètres : le contexte de construction et l'indice de l'élément.
  -itemCount (int) : Le nombre total d'éléments dans la grille. Il indique à GridView.builder combien d'éléments il doit construire.
  -
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
      title: 'SOS Quado',
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
  List<Color> cardColors = List.generate(5, (index) => Colors.grey); 

  @override
  Widget build(BuildContext context) {
    // final orientation = MediaQuery.of(context).orientation;
    // print(orientation);

    return Scaffold(
      body: GridView.builder(
        itemCount: students.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Card(
              // color: cardColors[index],
              child: Text(students[index].toString()),
            ),
            onTap: () {
              setState(() {
                // cardColors[index] = (cardColors[index] == Colors.grey) ? Colors.green : const Color.fromARGB(255, 255, 255, 255);
              });
            },
          );
        },
      ),
    );
  }
}





