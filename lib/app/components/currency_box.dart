import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> itens;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel?)? onChanged;

  const CurrencyBox({Key? key, required this.itens, required this.controller, required this.onChanged, required this.selectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              isExpanded: true,
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: itens.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(), 
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber
                ),
              ),
              hintText: 'Enter text',
            ),
          ),
        ),
      ],
    );
  }
}