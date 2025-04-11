import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';


import '../../controllers/goals_controller.dart';
import '../../models/goal.dart';

class FormGoals extends StatelessWidget {
final goalsController = Get.find<GoalsController>();
static final _formKey = GlobalKey<FormBuilderState>();

_submit() {
  if (_formKey.currentState!.saveAndValidate()) {   
    Goal goal = Goal(
      _formKey.currentState!.value['name'],   
      double.parse(_formKey.currentState!.value['amount']),
    );

    goalsController.add(goal);
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
          "Goals",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, 
          color: Color.fromRGBO(186,1,200,1)),
        ),),
        Center(child: Text(
          "Here is a form where you can add goals for your drinks (dl) and activities (0.5h)",
          style: TextStyle(fontSize: 16.0, 
          color: Color.fromRGBO(186,1,200,1)),
          ),
        ),
        Row(children: [
          Expanded(child: FormBuilderTextField(
            name: 'name',
            decoration: InputDecoration(
              hintText: 'activity/drink',
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
          child: Text("Add Goal"),
        ),
      ],
    ),
  );
}
}