import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_app/ui/route/route.dart';
import 'package:tour_app/ui/widgets/violet_button.dart';

import '../../business_logics/form.dart';
import '../../const/app_colors.dart';
import '../styles/styles.dart';

class UserForm extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;

  String gender = "Male";
  String? dob;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (selected != null && selected != selectedDate) {
      _dobController.value.text =
          '${selected.day} - ${selected.month} - ${selected.year}';
    }
    dob = _dobController.value.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
            top: 20.h,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tell Us More About You",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.violetColor,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "We will not share your information outside this application.",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                amarFormField(_nameController, TextInputType.name, "Full Name"),
                amarFormField(_phoneController, TextInputType.number, "Number"),
                amarFormField(_addressController, TextInputType.text, "Address"),
                Obx(
                  () => TextFormField(
                    readOnly: true,
                    controller: _dobController.value,
                    decoration: InputDecoration(
                      hintText: "Date of birth ",
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: Icon(Icons.calendar_today)),
                    ),
                  ),
                ),
                // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                SizedBox(
                  height: 10.h,
                ),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Male', 'Femal e'],
                  onToggle: (index) {
                    if (index == 0) {
                      gender = "Male";
                    } else {
                      gender = "Female";
                    }

                    print('switched to: $index');
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                VioletButton(
                    "Submit",
                    () => UserInfo().sendFormDataToDB(
                        _nameController.text,
                        int.parse(_phoneController.text),
                        _addressController.text,
                        dob!,
                        gender)),
              ],
             ),
          ),
        ),
      ),
    );
  }
}

Widget amarFormField(controller, inputType, hint) {
  return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: AppStyles().textFieldDecoration(hint));
}
