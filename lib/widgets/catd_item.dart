import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/models/task_model.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
   CardItem({required this.model, super.key});
   TaskModel model;
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Stack(
              children: [
                Container(
                  width: 360,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                 image: DecorationImage(
                  image: AssetImage("assets/images/${model.image}.png")
                  )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 43,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFF2FEFF)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              DateTime.fromMillisecondsSinceEpoch(model.date)
                              .toString().substring(8,11),
                             style: Theme.of(context).textTheme.titleMedium,),
                              Text(millisToMonth(model.date),
                              style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        )
                      ),
                      SizedBox(height: 80,),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(model.title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
                             const Spacer(),
                             const Icon(Icons.favorite,color: Color(0xFF5669FF),),
                              const Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 12),
                                 child: Icon(Icons.edit,color: Color(0xFF5669FF),),
                               ),
                                InkWell
                                (
                                  onTap: ()
                                  {
                                    FirebaseManager.deleteEvent(model.id);

                                  },
                                  child: Icon(Icons.delete,color: Color(0xFF5669FF),))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
  }
 String millisToMonth(int millis){
  DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
  return DateFormat('MMM','en').format(date);
 }
}