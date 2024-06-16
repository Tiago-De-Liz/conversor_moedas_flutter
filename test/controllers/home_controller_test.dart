import 'dart:math';

import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final TextEditingController toText = TextEditingController(); 
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('testar , no double', () {
    toText.text = '2,0';
    homeController.converter();
    expect(fromText.text,'0.36');
  });

  test('deve converter de real para dolar', () {
    toText.text = '2.0';
    homeController.converter();
    expect(fromText.text,'0.36');
  });

  test('deve converter de dolar para real', () {
    toText.text = '1.0';
    homeController.toCurrency = CurrencyModel(name: 'Dolar', real: 5.65, dolar: 1, euro: 0.85, bitcoin: 0.000088);
    homeController.fromCurrency = CurrencyModel(name: 'Real', real: 1, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.converter();
    expect(fromText.text,'5.65');
  });
}