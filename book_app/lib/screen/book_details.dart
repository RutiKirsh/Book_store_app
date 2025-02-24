import 'package:book_app/main.dart';
import 'package:book_app/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import '../model/book_model.dart';
import '../main.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  BookDetails({required this.book});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 45,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 300,
              child: Hero(
                tag: book.imageURL,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(book.imageURL, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book.author,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\$ ' + book.price,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Book Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      book.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          cart.add(book);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${book.title} added to cart.'),
                          ));
                        },
                        child: Text('Add to cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
