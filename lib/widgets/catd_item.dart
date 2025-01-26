import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Stack(
              children: [
                Container(
                  width: 360,
                  height: 200,
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                 image: DecorationImage(
                  image: AssetImage("assets/images/birthday.png")
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
                        height: 49,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFF2FEFF)
                        ),
                        child: Text("21\nNov",style: Theme.of(context).textTheme.titleMedium,),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("This is a Birthday Party ",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
                              Icon(Icons.favorite,color: Color(0xFF5669FF),)
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
}