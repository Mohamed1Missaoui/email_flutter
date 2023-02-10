import 'package:flutter/material.dart';

import 'frais_inscription.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //centerTitle: true,
       title: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('dashborad'),
        ),
     backgroundColor: Colors.indigo[300],
     actions: const <Widget>[
        Icon(Icons.search),
           Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.supervised_user_circle),
            ),
       Icon(Icons.more_vert),
    ],
     actionsIconTheme:const IconThemeData(
        size: 30.0, 
        color: Colors.orange, 
        opacity: 0.7 
     ),
    elevation: 30.0,
      ),
      body: const Center(
        child: Text('My Page!'),
        
      ),
      drawer: Drawer(
        
        child: ListView(
          
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('tableau de bord'),
              onTap: () {
             
                Navigator.push(
      context,
    MaterialPageRoute(builder: (context) => const tableaux_bord()),
  );
              },
            ),
            ListTile(
              onTap: () {
                const Text("frais d inscription");
                 Navigator.push(context,
    MaterialPageRoute(builder: (context) => const Formulaire(title: 'frais d inscription',)),);
ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              },
            child: const Text('Go back!'),
          );
              },
            ),
            
            ListTile(
              title: const Text('liste participation'),
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Quite'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
//  Navigator.pop?
class tableaux_bord extends StatefulWidget {
  const tableaux_bord({super.key});

  @override
  State<tableaux_bord> createState() => _tableaux_bordState();
}

class _tableaux_bordState extends State<tableaux_bord> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(  
          appBar: AppBar(  
            title: Text('Flutter Table Example'),  
          ),  
          body: Center(  
              child: Column(children: <Widget>[  
                Container(  
                  margin: EdgeInsets.all(20),  
                  child: Table(  
                    defaultColumnWidth: FixedColumnWidth(120.0),  
                    border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 2),  
                    children: [  
                      TableRow( children: [  
                        Column(children:[Text('Website', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Tutorial', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Review', style: TextStyle(fontSize: 20.0))]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Javatpoint')]),  
                        Column(children:[Text('Flutter')]),  
                        Column(children:[Text('5*')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Javatpoint')]),  
                        Column(children:[Text('MySQL')]),  
                        Column(children:[Text('5*')]),  
                      ]),  
                      TableRow( children: [  
                        Column(children:[Text('Javatpoint')]),  
                        Column(children:[Text('ReactJS')]),  
                        Column(children:[Text('5*')]),  
                      ]),  
                    ],  
                  ),  
                ),  
              ])  
          ));
  }
}



















