import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)
            ),
             color: Color(0xff5669FF),
          ),
                width: double.infinity,
                height: 174,
               
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,top: 45,right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome Back ✨",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
                               Text("Hesham Seliem",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
                               Row(
                                children: [
                                  Icon(Icons.location_on_outlined,color: Colors.white,),
                                  Text("Cairo, Egypt",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
        
                                ],
                               )
                            ],
                          ),
                          Row(
                            children: [
                             const Icon(Icons.sunny,color: Colors.white,),
                             const SizedBox(width: 10,),
                              Container(
                                alignment: Alignment.center,
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                                ),
                                child: Text("EN",style: Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.black),),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: SizedBox(
                  height: 50,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemBuilder: (context, index) {
                     return Container(
                      alignment: Alignment.center,
                      width: 85,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white
                        )
                      ),
                      child: Text("all",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    ),
                ),
              )
      ],
    );
  }
}