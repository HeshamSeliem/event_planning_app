import 'package:event_planning_app/provider/create_event_provider.dart';
import 'package:event_planning_app/widgets/event_category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateEvent extends StatelessWidget {
   CreateEvent({super.key});
  static const String routeName = "create event";

  
  
  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
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
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/${provider.categoriesImages[provider.currentEventIndex]}.png")
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>const SizedBox(width: 16,),
                    itemBuilder: (context, index) 
                    => GestureDetector(
                      onTap: ()
                      {
                       provider.changeEventType(index);
                      },
                      child: EventCategoryItem(
                        eventType: provider.categoriesImages[index],
                        isSelected:provider.categoriesImages[index] == provider.categoriesImages[provider.currentEventIndex],
                        ),
                    ),
                    itemCount: provider.categoriesImages.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
            ],
          ),
        ),
      );
      },
    );
  }
}