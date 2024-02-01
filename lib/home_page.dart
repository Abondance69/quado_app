import 'package:flutter/material.dart';
import 'functions/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
 @override
 Widget build(BuildContext context) {
  List<String> students = ['Nettoyage', 'Plomberie', 'Peinture', 'Simeon', 'David', 'Jordan'];
  List<IconData> servicesIcons = [Icons.cleaning_services, Icons.plumbing, Icons.palette, Icons.local_laundry_service];
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double radius = width/20;
  
  return Scaffold(
    appBar: AppBar(
      title: simpleText("Sos Quado"),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    backgroundColor:Colors.white,
    body: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(0),
        // margin: EdgeInsets.only(top : radius/4),
        height: height,
        child: Column(
          children: [
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    height: height/3.3,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                        image: NetworkImage(src),
                        fit: BoxFit.cover,
                      )
                    ),
                    // child: Image(
                    //   image: NetworkImage(src),
                    //   fit: BoxFit.cover,
                    //   width: width,
                    // ),
                  ),
                  

                  simpleText("Get 40% on cleaning", 35, FontWeight.bold, Colors.white),
                  
                  Padding(
                    padding: const EdgeInsets.only(top : 100),
                    child: Image(
                      image: const AssetImage(
                        "assets/images/pneu.png",
                      ),
                      width: width/2.6,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  
                ],
              ), 
            // ),

            Container(
              padding: const EdgeInsets.all(0),
              height: height/2.7,
              // color: Colors.blue,
              child: GridView.builder(
                itemCount: students.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Card(
                      elevation: width/100,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          simpleIcon(servicesIcons[0], 32, const Color.fromARGB(255, 0, 20, 36)),
                          simpleText(students[index].toString(), 20)
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: radius, top: 0, bottom: 0),
                    child: Container(
                      width: width / 1.5,
                      height: height/6,
                      padding: EdgeInsets.all(radius/2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 0, 7, 49),
                        ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              simpleText("Clients satisfait", 25, FontWeight.w500, Colors.white),
                              simpleText("\$ 24/h", 25, FontWeight.w400, const Color.fromARGB(255, 255, 237, 134)),
                              simpleText("Clients satisfait", 23, FontWeight.w500, Colors.white),
                            ],
                          ),

                          const Expanded(
                            child: Image(
                              image: AssetImage(
                                "assets/images/clean.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )                  
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(left: 0, right: radius, top: 0, bottom: 0),
                  //   child: Container(
                  //     width: width / 1.5,
                  //     height: height/6,
                  //     padding: EdgeInsets.all(radius/2),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: const Color.fromARGB(255, 0, 7, 49),
                  //       ),
                  //     child: Row(
                  //       children: [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             simpleText("Clients satisfait", 25, FontWeight.w500, Colors.white),
                  //             simpleText("\$ 24/h", 25, FontWeight.w400, const Color.fromARGB(255, 255, 237, 134)),
                  //             simpleText("Clients satisfait", 23, FontWeight.w500, Colors.white),
                  //           ],
                  //         ),

                  //         const Expanded(
                  //           child: Image(
                  //             image: AssetImage(
                  //               "assets/images/clean.png",
                  //             ),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       ],
                  //     )                  
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(left: 0, right: radius, top: 0, bottom: 0),
                    child: Container(
                      width: width / 1.2,
                      height: height/6,
                      padding: EdgeInsets.all(radius/2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 0, 7, 49),
                        ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              simpleText("Clients satisfait", 25, FontWeight.w500, Colors.white),
                              simpleText("\$ 24/h", 25, FontWeight.w400, const Color.fromARGB(255, 255, 237, 134)),
                              simpleText("Clients satisfait", 23, FontWeight.w500, Colors.white),
                            ],
                          ),

                          const Expanded(
                            child: Image(
                              image: AssetImage(
                                "assets/images/clean.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )                  
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ), 

    // BottomNavigationBar
    bottomNavigationBar: BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: "Wallet",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    ),
  );
 } 
}