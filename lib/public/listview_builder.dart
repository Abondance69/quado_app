import 'package:flutter/material.dart';
/* 
  1.ListView.builder
  ListView.builder est un widget fourni par le framework Flutter qui permet de créer dynamiquement une liste d'éléments en fonction des données fournies. Elle est souvent utilisée lorsque vous avez une liste longue ou infinie d'éléments à afficher, car elle construit seulement les éléments visibles à l'écran, ce qui améliore les performances.

  Propriétés :
  -itemCount : C'est le nombre total d'éléments dans votre liste de données.
  -itemBuilder : Cette fonction est appelée pour chaque élément de la liste. 
  -scrollDirection : Cette propriété optionnelle définit la direction dans laquelle la liste sera défilée.
  -controller : Cette propriété optionnelle vous permet de spécifier un contrôleur de défilement pour la liste. Vous pouvez l'utiliser pour contrôler manuellement la position du défilement ou pour écouter les événements de défilement.
  
  -physics : Propriété optionnelle qui spécifie le comportement physique du défilement, par exemple, BouncingScrollPhysics pour un effet de rebondissement sur iOS ou ClampingScrollPhysics pour un défilement classique.
  -padding : Cette propriété optionnelle permet de spécifier la marge intérieure de la liste.

  Nb : Utilisez le paramètre key pour améliorer les performances. Il permet de spécifier une clé unique pour chaque élément, ce qui aide Flutter à optimiser la reconstruction des éléments lors de mises à jour.

  2.ListView.separated
  ListView.separated est un élément du framework Flutter qui permet de créer une liste avec des éléments séparés. Il est similaire à ListView.builder, mais il ajoute automatiquement des séparateurs entre les éléments de la liste. Cela peut être utile lorsque vous avez besoin d'ajouter une ligne de séparation personnalisée entre chaque élément de la liste.
  
  3.ListTile
  Le widget ListTile dans Flutter est utilisé pour créer une ligne de liste typique avec un texte et éventuellement des icônes avant ou après le texte.

  Propriétés :
  -leading : Définit le widget qui sera affiché avant le texte dans le ListTile.
  -title : Contient le texte principal à afficher dans le ListTile.
  -subtitle : Contient un texte supplémentaire qui est affiché sous le titre.
  -trailing : Définit le widget qui sera affiché après le texte dans le ListTile.

  -contentPadding : Définit l'espacement interne du ListTile, contrôlant l'espace autour de son contenu.
  -onTap : Définit la fonction qui sera appelée lorsque le ListTile est tapé.
  -tileColor : Définit la couleur de fond du ListTile.
  -shape : Définit la forme du ListTile. Par exemple, vous pouvez utiliser RoundedRectangleBorder pour arrondir les coins.
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
                ListTile(
                  leading: Icon(studentImages[index]),
                  title: Text(students[index]),
                  subtitle: const Text("Les meilleurs élèves de l'école"),
                  trailing: Icon(getResult(students[index])),
                  tileColor: Colors.greenAccent,
                  onTap: () => showSnackBar(students[index]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
}
