import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/firebase/firebase_manager.dart';
import 'package:event_planning_app/models/task_model.dart';
import 'package:event_planning_app/provider/app_bar_provider.dart';
import 'package:event_planning_app/provider/user_provider.dart';
import 'package:event_planning_app/widgets/catd_item.dart';
import 'package:event_planning_app/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
   // var userProvider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AppBarProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppBarProvider>(context);
        var userProvider = Provider.of<UserProvider>(context);
        return  Scaffold(
        body: Column(
          children: [
            UserInfo(
              name: userProvider.userModel?.name ?? "nulll",
            ), 
            
           StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseManager.getEvent(provider.categoriesImages[provider.selectedIndex]),
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
      },
      
    );
  }
}