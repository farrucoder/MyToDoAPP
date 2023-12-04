import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Task Name Controller
  final TaskName = TextEditingController();

  //Task Data List
  List TaskData = [
    ['First Task', false],
    ['Create Some Task', true],
    ['Dummy Task', false],
    ['Go To Gym', true],
  ];

  //Add Notification Added Succesfully
  void addNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.purple[800],
            content: Container(
              child: Text('Added Successfully'),
            ));
      },
    );

    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('ToDo App'),
        leading: Icon(
          Icons.favorite,
          size: 40,
          color: Colors.purple[800],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),

          //Inpute Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple[400]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: TaskName,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Task Name',
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                TaskName.clear();
                              });
                            },
                            icon: Icon(Icons.clear)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),

                //Add Button
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.purple[700]),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (TaskName.text.isNotEmpty) {
                            TaskData.add([TaskName.text, false]);
                            addNotification(context);
                          }
                        });
                      },
                      icon: Text('ADD')),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),

          //Task Tile Builder
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: TaskData.length,
                itemBuilder: (BuildContext context, Index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                              value: TaskData[Index][1],
                              onChanged: (value) {
                                setState(() {
                                  TaskData[Index][1] = !TaskData[Index][1];
                                });
                              }),
                          Text(
                            TaskData[Index][0],
                            style: TextStyle(
                              decoration: TaskData[Index][1]
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  TaskData[Index][1]
                                      ? TaskData.removeAt(Index)
                                      : print('Could not delete');
                                });
                              },
                              icon: Icon(Icons.delete,size: 30,))
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple[400]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
