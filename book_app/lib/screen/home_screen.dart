// import 'package:flutter/material.dart';
// import '../model/book_model.dart';
// import 'book_details.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class HomeScreen extends StatefulWidget {
//   final VoidCallback toggleTheme;
//   final bool isDarkMode;

//   HomeScreen({
//     required this.toggleTheme,
//     required this.isDarkMode,
//   });

//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Book> displayBooks = books;
//   TextEditingController searchBook = TextEditingController();

//   void _filterBooks(String query) {
//     setState(() {
//       displayBooks = books.where((book) {
//         return book.title.toLowerCase().contains(query.toLowerCase()) ||
//             book.author.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Books App",
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//             ),
//             onPressed: widget.toggleTheme,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: searchBook,
//                 onChanged: _filterBooks,
//                 decoration: InputDecoration(
//                   hintText: 'Search books...',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               _buildSectionTitle('Books Collection', widget.isDarkMode),
//               SizedBox(
//                 height: 20,
//               ),
//               buildBookSlider(displayBooks),
//               SizedBox(
//                 height: 10,
//               ),
//               _buildSectionTitle("More Books", widget.isDarkMode),
//               SizedBox(
//                 height: 20,
//               ),
//               buildBookList(displayBooks),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title, bool isDarkMode) {
//     return Text(
//       title,
//       style: TextStyle(
//         color: isDarkMode ? Colors.white : Colors.black,
//         fontSize: 18,
//       ),
//     );
//   }

//   Widget buildBookSlider(List<Book> books) {
//     return CarouselSlider.builder(
//       itemCount: books.length,
//       itemBuilder: (context, index, child) {
//         final book = books[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BookDetails(book: book)
//               ),
//             );
//           },
//           child: Stack(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                     image: AssetImage(book.imageURL),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                   color: Colors.black54,
//                   child: Text(
//                     book.title,
//                     textAlign: TextAlign.center,
//                     maxLines: 1,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: Colors.white
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       options: CarouselOptions(
//         autoPlay: true,
//         enlargeCenterPage: true,
//         aspectRatio: 1.7,
//         autoPlayInterval: Duration(seconds: 2),
//       ),
//     );
//   }

//   Widget buildBookList(List<Book> books) {
//     return Container(
//       height: 250, // גובה הקונטיינר שיתאים לגובה הספרים ברשימה
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal, // קביעת כיוון גלילה אופקי
//         itemCount: books.length,
//         itemBuilder: (context, index) {
//           final book = books[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BookDetails(book: book)
//                 ),
//               );
//             },
//             child: Container(
//               width: 180, // רוחב הספר בקונטיינר
//               margin: EdgeInsets.symmetric(horizontal: 10), // מרווח בין הספרים
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: AssetImage(book.imageURL),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import '../model/book_model.dart';
import 'book_details.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  HomeScreen({
    required this.toggleTheme,
    required this.isDarkMode,
  });

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> displayBooks = books;
  TextEditingController searchBook = TextEditingController();

  void _filterBooks(String query) {
    setState(() {
      displayBooks = books.where((book) {
        return book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Books App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: widget.toggleTheme,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchBook,
                onChanged: _filterBooks,
                decoration: InputDecoration(
                  hintText: 'Search books...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildSectionTitle('Books Collection', widget.isDarkMode),
              SizedBox(
                height: 20,
              ),
              buildBookSlider(displayBooks),
              SizedBox(
                height: 10,
              ),
              _buildSectionTitle("More Books", widget.isDarkMode),
              SizedBox(
                height: 20,
              ),
              buildBookList(displayBooks),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return Text(
      title,
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
        fontSize: 18,
      ),
    );
  }

  Widget buildBookSlider(List<Book> books) {
    return CarouselSlider.builder(
      itemCount: books.length,
      itemBuilder: (context, index, child) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetails(book: book)
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(book.imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.black54,
                  child: Text(
                    book.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 1.7,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }

  Widget buildBookList(List<Book> books) {
    return SizedBox(
      height: 250, // גובה הקונטיינר שיתאים לגובה הספרים ברשימה
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // קביעת כיוון גלילה אופקי
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(book: book)
                ),
              );
            },
            child: Container(
              width: 180, // רוחב הספר בקונטיינר
              margin: EdgeInsets.symmetric(horizontal: 10), // מרווח בין הספרים
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(book.imageURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
