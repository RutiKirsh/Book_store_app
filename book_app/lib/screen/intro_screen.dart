import 'package:book_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../model/book_model.dart';
class IntroScreen extends StatefulWidget{
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  IntroScreen({
    required this.toggleTheme,
    required this.isDarkMode,
  });

_IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>{



  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleTheme),
          
        ],
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Welcome to the big books aplication!',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
                itemCount:books.length,
                itemBuilder: (context, index){
                  final book = books[index];
                  return GridTile(
                    child: Image.asset(book.imageURL, fit: BoxFit.cover,),
                    footer: GridTileBar(
                      backgroundColor: Colors.black45,
                      title: Text(book.title, textAlign:TextAlign.center,),
                    )
                  );

                },
                )
              ),
              SizedBox(height: 5,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      toggleTheme: widget.toggleTheme,
                       isDarkMode: widget.isDarkMode),
                   ),
                   );
                },
                child: Text("let\'s see our books...")
                 )

          ],
        ),
        ),
    );
  }
}





















//קוד שלי
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'home_screen.dart';

// class IntroScreen extends StatefulWidget {
//   final VoidCallback toggleTheme;
//   final bool isDarkMode;

//   IntroScreen({
//     required this.toggleTheme,
//     required this.isDarkMode,
//   });

//   _IntroScreenState createState() => _IntroScreenState();
// }




// class _IntroScreenState extends State<IntroScreen> {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
               
//         body: Padding(
//           padding: EdgeInsets.only(top:200),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
              
//               Text(
//                 ' Welcome to our book store!',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 0, 212, 127),
//                 ),
//               ),
//               Padding(padding: EdgeInsets.only(bottom: 300)),

//               ElevatedButton(
//                 onPressed: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomeScreen(
//                       toggleTheme: widget.toggleTheme,
//                       isDarkMode: widget.isDarkMode,
//                     )),
//                     )
//                 },
//                 style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                 ),
//                 child: Text(
//                         'let\'s see our books...',
//                         style: TextStyle(fontSize: 20),
//                       ),
                
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

