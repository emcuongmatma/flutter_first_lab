import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../screens/refund_screen.dart';

class BankSelectionWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(BankModel) onSelected;

  const BankSelectionWidget({
    super.key,
    required this.controller,
    required this.onSelected,
  });

  @override
  State<BankSelectionWidget> createState() => _BankSelectionWidgetState();
}

class _BankSelectionWidgetState extends State<BankSelectionWidget> {
  String? bankImageUrl;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<BankModel>(
      suggestionsCallback: (search) => [
        BankModel("assets/images/ic_techcombank.png", "Techcombank"),
        BankModel("assets/images/ic_techcombank.png", "Techcombank"),
        BankModel("assets/images/ic_techcombank.png", "Techcombank"),
      ],
      controller: widget.controller,
      builder: (context, controller, focusNode) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
          validator: validatorString,
          decoration: InputDecoration(
            prefixIcon: bankImageUrl != null
                ? Image.asset(bankImageUrl!)
                : const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Chọn ngân hàng",
          ),
        );
      },
      itemBuilder: (context, item) {
        return ListTile(
          leading: Image.asset(item.imageUrl, width: 32, height: 32),
          title: Text(item.bankName),
        );
      },
      onSelected: (item){
        setState(() {
          bankImageUrl = item.imageUrl;
          widget.onSelected(item);
        });
      },
    );
  }
}

class BankModel {
  final String imageUrl;
  final String bankName;

  BankModel(this.imageUrl, this.bankName);
}