import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/key_button.dart';
import '../controller/key_service_controller.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({super.key});

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  bool isSheAll = false;

  @override
  Widget build(BuildContext context) {
    final LanguageButtonsController languageButtonsController =
        Get.put(LanguageButtonsController());

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SizedBox(
          child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4, crossAxisCount: 2, mainAxisSpacing: 4),
        itemCount:
            isSheAll ? languageButtonsController.listOfObjectives.length : 8,
        itemBuilder: (context, index) {
          return index == 7
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSheAll = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2F5B6C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'See All..',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : LanguageButton(
                  onTap: () {
                    languageButtonsController
                        .changeStateForMembershipObjectives(
                            languageButtonsController
                                .listOfObjectivesButtonUniqueId[index],
                            index);
                  },
                  buttonHeight: 45,
                  buttonText: languageButtonsController
                      .listOfObjectivesButtonUniqueId[index],
                  uniqueButtonId: languageButtonsController
                      .listOfObjectivesButtonUniqueId[index]);
        },
      )),
    );
  }
}
