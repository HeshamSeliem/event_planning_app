import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/models/task_model.dart';
import 'package:event_planning_app/widgets/catd_item.dart';
import 'package:event_planning_app/widgets/user_info.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserInfo(),

         StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseManager.getEvent(),
          builder: (context, snapshot) {
            return Expanded(
             child: ListView.builder(
              itemBuilder: (context, index) => CardItem(
                model: snapshot.data!.docs[index].data(),
              ),
              itemCount: snapshot.data?.docs.length ?? 0,
              ),
           );
          },
         )
            
         

        ],
      )
    );
  }
}