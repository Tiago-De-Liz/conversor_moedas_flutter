import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController(); 
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  itens: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                ),
                SizedBox(height: 10,),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  itens: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, 
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    homeController.converter();
                  }, 
                  child: Text('Converter')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}