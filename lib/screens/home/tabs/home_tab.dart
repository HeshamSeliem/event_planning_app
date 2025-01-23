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
         Expanded(
           child: ListView.builder(
            itemBuilder: (context, index) => CardItem(),
            itemCount: 200,
            ),
         )
            
         

        ],
      )
    );
  }
}