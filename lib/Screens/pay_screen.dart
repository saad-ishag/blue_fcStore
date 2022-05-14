import 'package:blue_fc_store/Screens/tick_mark_screen.dart';
import 'package:blue_fc_store/Screens/tools/bought_product.dart';
import 'package:blue_fc_store/logic/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayScreen extends StatefulWidget {
  static const String id = 'pay screen';

  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
 // int totalAmount(){
 //    final boughtProduct= Provider.of<ProviderData>(context).boughtProducts;
 //
 //    int amountSum = 0;
 //    for(BoughtProduct product in boughtProduct) {
 //      amountSum = amountSum + product.amount;
 //    }
 //    return amountSum;
 //
 // }
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff499CC6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [Color(0xff106199), Color(0xff499CC6)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  )),
              Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            Provider.of<ProviderData>(context).boughtProducts,
                      ),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 15),
                    alignment: Alignment.center,
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xff106199), Color(0xff499CC6)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                         Expanded(
                          child: ListTile(
                            leading: Text(
                              //TODO fix this total amount and make it vary
                              context.watch<ProviderData>().totalAmount(1).toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: const Text(
                              'مجموع السنة',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: ListTile(
                            leading: Text(
                              '\$100',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              'رسوم التوصيل',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: ListTile(
                            leading: Text(
                              '\$250',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              'ضريبة',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListTile(
                            leading: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TickMark()));
                              },
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                      const Color(0xff2374A9).withOpacity(.8),
                                  size: 18,
                                ),
                              ),
                              label: const Text(
                                'الدفع',
                                style: TextStyle(fontSize: 17),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(130, 100),
                                primary: Colors.white,
                                onPrimary:
                                    const Color(0xff2374A9).withOpacity(.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            trailing: const Text(
                              '\$4,250',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
