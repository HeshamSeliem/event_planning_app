import 'package:event_planning_app/provider/app_bar_provider.dart';
import 'package:event_planning_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
   UserInfo({required this.name, super.key});
    
     String name;
  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AppBarProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppBarProvider>(context);
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
                                 Text(name,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
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
                  padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                  child: SizedBox(
                    height: 50,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(width: 10,),
                      itemBuilder: (context, index) {
                       return InkWell(
                        onTap: ()
                        {
                          provider.onChanged(index);
                        },
                         child: Container(
                          alignment: Alignment.center,
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: provider.selectedIndex==index? Colors.white : Colors.transparent,
                            border: Border.all(
                              color: Colors.white
                            )
                          ),
                          child: Text(provider.categoriesImages[index],style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: provider.selectedIndex==index ? Theme.of(context).primaryColor : Colors.white,
                            fontSize: 18
                          ),)
                          ),
                       );
                      },
                      itemCount: provider.categoriesImages.length,
                      scrollDirection: Axis.horizontal,
                      ),
                  ),
                )
        ],
      );
      },
      
    );
  }
}