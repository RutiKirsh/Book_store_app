import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget{
  final VoidCallback onPaymentSuccess;

  PaymentScreen({required this.onPaymentSuccess})

  _PaymentScreenState createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen>{

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
     
      
    );
  }
}