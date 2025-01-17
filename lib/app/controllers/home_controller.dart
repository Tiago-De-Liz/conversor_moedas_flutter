import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel> currencies = [];

  final TextEditingController toText;
  CurrencyModel toCurrency = CurrencyModel(name: '', real: 0, dolar: 0, euro: 0, bitcoin: 0);

  final TextEditingController fromText;
  CurrencyModel fromCurrency = CurrencyModel(name: '', real: 0, dolar: 0, euro: 0, bitcoin: 0);

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void converter() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.name == 'Real') {
      returnValue = value * toCurrency.real;
    } else
    if (fromCurrency.name == 'Dolar') {
      returnValue = value * toCurrency.dolar;
    } else
    if (fromCurrency.name == 'Euro') {
      returnValue = value * toCurrency.euro;
    } else
    if (fromCurrency.name == 'Bitcoin') {
      returnValue = value * toCurrency.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}