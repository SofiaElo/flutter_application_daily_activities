import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';


import '../../controllers/activities_controller.dart';
import '../../models/activity.dart';

class FormActivities extends StatelessWidget {
final activitiesController = Get.find<ActivitiesController>();
static final _formKey = GlobalKey<FormBuilderState>();

_submit() {
  if (_formKey.currentState!.saveAndValidate()) {   
    Activity activity = Activity(
      _formKey.currentState!.value['activity'],   
      _formKey.currentState!.value['time'],
    );

    activitiesController.add(activity);
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
          "Activities",
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, 
          color: Color.fromRGBO(186,1,200,1)),
        ),),
        Center(child: Text(
          "Here is a form where you can add your activities and their durations:",
          style: TextStyle(fontSize: 16.0, 
          color: Color.fromRGBO(186,1,200,1)),
          ),
        ),
        FormBuilderTextField(
          name: 'activity',
          decoration: InputDecoration(
            hintText: 'the activity',
            border: OutlineInputBorder(),
          ),
          autovalidateMode: AutovalidateMode.disabled,
          validator: FormBuilderValidators.required(),
        ),
        SizedBox(height: 24.0),
        Text('duration in 0.5h accuracy'),
        FormBuilderSlider(
          name: 'time',
          min: 0.0,
          max: 24.0,
          divisions: 48,
          initialValue: 0.5,
          onChanged: (double? value) {},
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: _submit,
          child: Text("Add Activity"),
        ),
      ],
    ),
  );
}
}