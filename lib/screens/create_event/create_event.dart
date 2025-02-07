import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/models/task_model.dart';
import 'package:event_planning_app/provider/change_date_provider.dart';
import 'package:event_planning_app/provider/create_event_provider.dart';
import 'package:event_planning_app/widgets/event_category_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateEvent extends StatelessWidget {
  CreateEvent({super.key});
  static const String routeName = "create event";

  var titleController = TextEditingController();
  var descreptionController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( context) => CreateEventProvider(),
      builder: ( context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Create Event",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                          "assets/images/${provider.categoriesImages[provider.currentEventIndex]}.png")),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          provider.changeEventType(index);
                        },
                        child: EventCategoryItem(
                          eventType: provider.categoriesImages[index],
                          isSelected: provider.categoriesImages[index] ==
                              provider
                                  .categoriesImages[provider.currentEventIndex],
                        ),
                      ),
                      itemCount: provider.categoriesImages.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.titleLarge,
                    decoration: const InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(fontSize: 25),
                      prefixIcon: Icon(Icons.edit_note),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          // Blue border
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: descreptionController,
                    style: Theme.of(context).textTheme.titleLarge,
                    decoration: const InputDecoration(
                      hintText: "description",
                      //hintStyle: TextStyle(fontSize: 25),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Select Date",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      InkWell(
                        onTap: ()
                       async{
                         var choosenDate =await showDatePicker(context: context,
                         initialDate: DateTime.now(),
                           firstDate: DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now().add(Duration(days: 365)));
                            if(choosenDate != null)
                            {
                             provider.changeDate(choosenDate);
                             
                              
                            }
                        },
                        child: Text(
                          provider.selectedDate.toString().substring(0 , 10),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () 
                      {
                       TaskModel task= TaskModel(
                          title: titleController.text,
                         image: provider.categoriesImages[provider.currentEventIndex],
                          date: provider.selectedDate.microsecondsSinceEpoch,
                           descreption: descreptionController.text
                           );
                        FirebaseManager.addEvent(task).then((onValue)
                        {
                          Navigator.pop(context);
                          
                        }
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Color(0xff5669FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "add Event".tr(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
