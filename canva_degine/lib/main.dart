import 'package:flutter/material.dart';

void main(){
  runApp(Home());
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var titleController=TextEditingController();
  List<dynamic> dataList=["Suraj kumar singh","Ronit Kumar","Pankaj kumar","Manoj kumar"];
  var Taskdone=false;

  void addData(){
    dataList.add(titleController.text);
    setState(() {

    });
  }

  void delete(int index){
    dataList.removeAt(index);
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: 4, child: Scaffold(

      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 5,),
            Text('TaskFlow', style: TextStyle(fontSize: 25, color: Colors.purple, fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text("Organize your life with beautiful lists", style: TextStyle(color: Colors.grey,fontSize: 14)),
          ],
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Personal",),
              Tab(text: "Work",),
              Tab(text: "Shopping",),
              Tab(text: "Ideas",),
            ]
        ),
        centerTitle: true,
      ),
      body: TabBarView(children: [
        Padding(padding: EdgeInsets.all(10),
            child: Container(
                child: Column(
                  children: [
                    Padding(padding:EdgeInsets.only(right: 130),
                      child:   Text("Personal Task",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration( hintText: 'Call mom for her birthday',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            controller: titleController,
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(onPressed: (){
                          addData();
                        }, child: Text("Add")),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Checkbox(
                                value: Taskdone,
                                onChanged: (value) {
                                  setState(() {
                                    Taskdone = value!;
                                  });
                                },
                              ),
                              title: Text(dataList[index],
                                style: TextStyle(
                                  decoration: Taskdone ? TextDecoration.lineThrough : TextDecoration.none,

                                ),
                              ),
                              trailing: IconButton(onPressed: ()  {
                                delete(index);

                              }, icon: Icon(Icons.delete,color: Colors.red,)),
                            ),
                          );
                        },),
                    )
                  ],
                ),
              ),
            ),



        Container(
          color: Colors.green,
        ),

        Container(
          color: Colors.blue,
        ),

        Container(
          color: Colors.black,
        ),
      ]),
    )
    ),
    );
  }
}