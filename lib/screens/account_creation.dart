import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/key_button.dart';
import '../controller/key_service_controller.dart';

class AccountCreation extends StatelessWidget {
  const AccountCreation({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageButtonsController languageButtonsController =
        Get.put(LanguageButtonsController());

    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            // This buttons only created for Testing
            ElevatedButton(onPressed: () {}, child: Text('My Name is Pk')),

            // This is The main Component
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3.99,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return index == 7
                      ? ElevatedButton(
                          onPressed: () {
                            _showDialoge(context, languageButtonsController);
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
              ),
            ),

            // This buttons only created for Testing
            ElevatedButton(onPressed: () {}, child: Text('My Name is Pk')),
          ],
        ));
  }

  void _showDialoge(BuildContext context,
      LanguageButtonsController languageButtonsController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            width: Get.width * .8,
            height: 45,
            child: FloatingActionButton(
                backgroundColor: Color(0XffB8FE22),
                onPressed: () {
                  Get.back();
                },
                child: Text('Selected')),
          ),
          body: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3.99, crossAxisCount: 2, mainAxisSpacing: 4),
            itemCount:
                languageButtonsController.listOfObjectivesButtonUniqueId.length,
            itemBuilder: (context, index) {
              return LanguageButton(
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
          ),
        );
      },
    );
  }
}
