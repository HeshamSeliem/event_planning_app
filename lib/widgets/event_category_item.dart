import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventCategoryItem extends StatelessWidget {
   EventCategoryItem({required this.eventType,required this.isSelected,super.key});
  String eventType;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Theme.of(context).primaryColor
        )
      ),
      child: Text(
        eventType,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor
        ),
      ),
    );
  }
}
