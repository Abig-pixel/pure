import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';


    List list_of_users=[
      {"albumId":1,
      "id":4,
      "title":"Chuka Ikokwu",
      "url":"https://via.placeholder.com/600/d32776",
      "thumbnailUrl":"assets/pp.jpg",
   
      "date":"Admin since 24/12/2020",
      "group":"Admins"
      },
      {"albumId":1,
      "id":4,
      "title":"Shaela Dryuon",
      "url":"https://via.placeholder.com/600/d32776",
      "thumbnailUrl":"assets/pp_sec.png",
  
      "date":"Admin Since 25/12/2020",
      "group":"Admins"
      },
       {"albumId":1,
      "id":4,
      "title":"Steve jhonson ",
      "url":"https://via.placeholder.com/600/d32776",
      "thumbnailUrl":"assets/pp.jpg",
  
      "date":"Admin Since 25/12/2020",
      "group":"Coaches"
      },
       {"albumId":1,
      "id":5,
      "title":"Steven Drek ",
      "url":"https://via.placeholder.com/600/d32776",
      "thumbnailUrl":"assets/pp.jpg",

      "date":"Admin since 24/12/2020",
      "group":"Coaches"
      },
            {"albumId":1,
      "id":6,
      "title":"Steven Drek ",
      "url":"https://via.placeholder.com/600/d32776",
      "thumbnailUrl":"assets/pp.jpg",
     
      "date":"Admin since 24/12/2020",
      "group":"Coaches"},
        {"albumId":1,
      "id":4,
      "title":"David Oyakilome",
      "url":"https://via.placeholder.com/600/d32776",
      "thumbnailUrl":"assets/pp.jpg",

      "date":"Admin since 23/12/2020",
      "group":"Moderator"
      },
      
    ];
     List display_list=List.from(list_of_users);
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: GroupListView(),
      debugShowCheckedModeBanner: false,
     
    );
  }
}

class GroupListView extends StatefulWidget {
  

  @override
  State<GroupListView> createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
     void updateList(String value){
      setState(() {
        display_list = list_of_users.where((element) => element['title'].toLowerCase().contains(value.toLowerCase())).toList();
      });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromARGB(255, 15, 15, 15),
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      elevation: 0.0,
      toolbarHeight: 80,
      //titleSpacing: 0,
      //automaticallyImplyLeading: false,
      
      title: Column(
      children: [
        SizedBox(
              height:20.0
            ),
        Row(
          
          children: [
             SizedBox(width: 100),
            Center(child: Text('Manage Admins',
                    
                    style:TextStyle(fontSize:18,fontWeight:  FontWeight.bold,color: Colors.white),
                    ),
            
            ),
            SizedBox(width: 80),
            /*Icon(
                                    Icons.heart_broken_sharp,
                                    size: 25,
                                    color: Colors.white,
                                  ),*/
           IconButton(
            icon: Image.asset('assets/heart.png'),
            iconSize: 5,
            onPressed: () {},
          )   
        /*  Container(
            height:30,
            width:30,
           decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/heart_logo.jpg'"),
            fit: BoxFit.cover,
          ),
           
            
        ),
          ),*/                   
          ],
        ),
        
            
            Container(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 30,
                child: TextField(
                 
                  onChanged: (value) => updateList(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    // isDense: true,                      // Added this
                   
                     filled: true,
                     fillColor: Color.fromARGB(255, 42, 42,44),
                     border:OutlineInputBorder(
                       borderRadius:BorderRadius.circular(8.0),
                       borderSide: BorderSide.none,
                     ),
                     hintText: "Search",
                     hintStyle: TextStyle(color: Color.fromARGB(255, 97, 93, 93)), 
                     prefixIcon: Icon(Icons.search,color: Color.fromARGB(255, 235, 230, 230),),
                  ),
                          
                ),
              ),
            ),
      ],
    )),
    
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,0),
        child: Center(
          child: GroupedListView<dynamic, String>(
          elements: display_list,
          groupBy: (element) => element['group'],
          groupSeparatorBuilder: (String groupByValue) =>Padding(
            padding: EdgeInsets.all(10),
            child:Row(children:[
              Flexible(child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left:10,right:10),
                    child:Text(groupByValue,
                    textAlign: TextAlign.start,
                    style:TextStyle(fontSize:18,fontWeight:  FontWeight.bold,color: Colors.white),
                    ),
                  ),
                   
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: FloatingActionButton(
                                  
                                  backgroundColor: Colors.white,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                ],
              ))
            ])
          ),
          itemBuilder: (context, dynamic element) {
            return Card(
              color:Color.fromARGB(255, 15, 15, 15),
              elevation: 0,
              margin: EdgeInsets.symmetric(horizontal:5,vertical: 5),
             child:Container(
               
              // padding: EdgeInsets.all(10),
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Expanded(
                    child:ClipOval(
                      child: Image(
                       image:NetworkImage(element['thumbnailUrl']),
                       fit: BoxFit.cover
                     )
                             ), 
                   ),

                  Expanded(flex:5,child: Container(
                 // padding : EdgeInsets.only(bottom:10),
                  child:Column(
                   //mainAxisAlignment: MainAxisAlignment.start, 
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(padding: EdgeInsets.only(left:5,right:5,top:2),
      
                     child:Column(
                       //mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                              element['title'],
                             style:TextStyle(fontSize:16,fontWeight:FontWeight.bold,color: Colors.white),
                              
                              //maxLines:2,
                              overflow:TextOverflow.ellipsis,
                             ),
                             /*Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24.0,
                              
                            ),*/
                           
                              
                            /* SizedBox(
                               width:220,
                             ),*/
                             Text(
                               "...",
                              style:TextStyle(fontSize:45,fontWeight:FontWeight.bold,color:Colors.white),
                         
                               
                             )
                           ],
                         ),
                       
                             Container(
                               //padding: const EdgeInsets.only(left:8.0),
                               child: Text(
                                element['date'],
                                style:TextStyle(fontSize:12,fontWeight:FontWeight.bold,color: Colors.white),
                                //maxLines:2,
                               // overflow:TextOverflow.ellipsis,
                               ),
                             ),
                          
                       ],
                     ),
                     

                     )
                   ],
                  )
                  )) 
                 ],
               )
             )
            );
          },
          itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']), // optional
          //useStickyGroupSeparators: true, // optional
          //floatingHeader: true, // optional
         // order: GroupedListOrder.ASC, // optional
      ),
        ),
      ),
    ),
    bottomNavigationBar: SizedBox(
      height: 55,
      child: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        iconSize: 25,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items:  [
                  BottomNavigationBarItem(
                     
                    icon: Icon(Icons.people,color: Colors.white),
                   
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.not_interested,color: Colors.white),
                    
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message ,color: Colors.white),
                    backgroundColor: Colors.white,
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check,color: Colors.white),
                    backgroundColor: Colors.white,
                    label: '',
                  ),
                ]),
    ),
    );
  }
}
