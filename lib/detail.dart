import 'package:flutter/material.dart';
import 'package:fp30/Products.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class detail extends StatefulWidget {
  int index;
  List<Products> items;

  detail(this.index, this.items);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MY",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
                height: 25,
                width: 25,
                child: Image(image: AssetImage("myimage/lv_logo.png"))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 20),
              child: Container(
                height: 300,
                margin: EdgeInsets.only(bottom: 30, left: 40, right: 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                        height: 150,
                        width: 150,
                        image: NetworkImage(
                            widget.items[widget.index].image.toString())),
                    Text("${widget.items[widget.index].title}"),
                    Text("${widget.items[widget.index].price}"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: InkWell(
                onTap: () {
                  Razorpay razorpay = Razorpay();
                  var options = {
                    'key': 'rzp_live_ILgsfZCZoFIKMb',
                    'amount': widget.items[widget.index].price,
                    'name': 'Louis vuitton',
                    'description': '${widget.items[widget.index].title}',
                    'retry': {'enabled': true, 'max_count': 1},
                    'send_sms_hash': true,
                    'prefill': {
                      'contact': '8888888888',
                      'email': 'test@razorpay.com'
                    },
                    'external': {
                      'wallets': ['paytm']
                    }
                  };
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      handlePaymentSuccessResponse);
                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                      handleExternalWalletSelected);
                  razorpay.open(options);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image(
                            height: 90,
                            width: 90,
                            image: NetworkImage(
                                widget.items[widget.index].image.toString())),
                        ListTile(
                          title: Text("${widget.items[widget.index].title}"),
                          subtitle: Text("${widget.items[widget.index].price}"),
                          trailing: IconButton(
                              onPressed: () {}, icon: Icon(Icons.bookmark)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
