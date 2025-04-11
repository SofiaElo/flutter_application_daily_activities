import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';


import '../../controllers/drinks_controller.dart';
import '../../models/drinks.dart';

class FormDrinks extends StatelessWidget {
final drinksController = Get.find<DrinksController>();
static final _formKey = GlobalKey<FormBuilderState>();

_submit() {
  if (_formKey.currentState!.saveAndValidate()) {   
    Drink drink = Drink(
      _formKey.currentState!.value['drink'],   
      double.parse(_formKey.currentState!.value['amount']),
    );

    drinksController.add(drink);
    _formKey.currentState?.reset();  
  }
}


@override
Widget build(BuildContext context) {
  return FormBuilder(
    key: _formKey,
    child: Column(
      children: [
        Center(child: Text(
          "Drinks",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, 
          color: Color.fromRGBO(186,1,200,1)),
        ),),
        Center(child: Text(
          "Here is a form where you can add your drinks and the amounts in dl:",
          style: TextStyle(fontSize: 16.0, 
          color: Color.fromRGBO(186,1,200,1)),
          ),
        ),
        Row(children: [
          Expanded(child: FormBuilderTextField(
            name: 'drink',
            decoration: InputDecoration(
              hintText: 'the drink',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.required(),
            ),
          ),
          SizedBox(width: 16),
          Expanded(child: FormBuilderTextField(
            name: 'amount',
            decoration: InputDecoration(
              hintText: 'the amount',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
            ]),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ],),        
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: _submit,
          child: Text("Add Drink"),
        ),
      ],
    ),
  );
}
}