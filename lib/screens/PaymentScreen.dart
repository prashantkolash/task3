import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class paymentScreen extends StatefulWidget {
  @override
  _paymentScreenState createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
  Razorpay _razorpay;
  String _amount;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_dFpFaAhgfSJvej',
      'amount': num.parse(_amount).toInt() * 100,
      'name': '',
      'description': 'Payment',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Toast.show('Success ' + response.paymentId, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Toast.show("Error " + response.code.toString(), context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Toast.show('External Wallet ' + response.walletName, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    final String arguments =
        ModalRoute.of(context).settings.arguments as String;
    String x = arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'fifth', arguments: x);
              },
              child: Icon(Icons.home))
        ],
        title: Text(
          'RAZORPAY',
          style: TextStyle(
            fontFamily: 'monto',
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.tealAccent[700],
              ),
              child: Icon(
                Icons.android,
                size: 50,
              ),
            ),
            ListTile(
              title: Text('item1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('item 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () {
                showDialog(
                  context: context,
                  // ignore: missing_return
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('LOG OUT'),
                      content: Text('Do you want to Log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              Navigator.pushReplacementNamed(context, 'first');
                            }).catchError((e) {
                              print(e);
                            });
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.tealAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            onChanged: (value) {
              setState(() {
                _amount = value;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.attach_money,
                color: Colors.tealAccent,
              ),
              //filled: true,
              // fillColor: Colors.grey,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
              ),
              hintText: 'Enter amount to be paid',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              openCheckout();
            },
            child: Text('PAY'),
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
// children: [
// Center(
// child: Text('HELLO'),
// ),
// ElevatedButton(
// onPressed: () {
// FirebaseAuth.instance.signOut().then((value) {
// Navigator.pushReplacementNamed(context, 'first');
// }).catchError((e) {
// print(e);
// });
// },
// child: Text('LOG OUT'),
// ),
// ],
// );
