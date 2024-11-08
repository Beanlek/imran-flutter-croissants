import 'package:flutter/material.dart';
import 'package:tutorial_flutter/page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key,
    required this.title,
  });

  final String title;

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  late List<String> croissants = [];
  final TextEditingController nameController = TextEditingController();
  final ScrollController mainScrollController = ScrollController();

  void insertCroissants() {
    setState(() {
      croissants.insert(0, nameController.text.trim());
    });
  }

  void deleteCroissants(int index) {
    setState(() {
      croissants.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();

    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
    croissants.add('imran');
    croissants.add('iman');
    croissants.add('shaza');
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      
      AppBar(
        backgroundColor: Colors.red[900],
        title: Text('${widget.title} Page 1', style: TextStyle(color: Colors.white),),
      ),

      body: Padding(padding: EdgeInsets.all(12.0),
        child: SizedBox( height: MediaQuery.of(context).size.height,
          child: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded( flex: 1,
                child: InkWell(
                  onTap: () async {
                    await showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text('Insert your name'),
                        content: TextField(
                          controller: nameController,
                        ),
                        
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.pop(context, false);
                          }, child: Text('Cancel')),

                          TextButton(onPressed: () {
                            Navigator.pop(context, true);
                          }, child: Text('Add')),
                        ],
                      );
                    }).then((res) {

                      if (res) {
                        insertCroissants();
                      }

                    });
                  },
                  
                  child: Card(
                    color: Colors.black,
                    child: Center(child: Text('Add Item', style: TextStyle(color: Colors.white),),),
                  ),
                )
              ),
          
              Expanded( flex: 4,
              
                child: RawScrollbar(
                  thumbColor: Colors.black,
                  thumbVisibility: true,
                  thickness: 3,
                  controller: mainScrollController
                  ,
                  child: ListView.builder(
                    controller: mainScrollController,
                                    
                    itemCount: croissants.length,
                    itemBuilder: (context, index) {
                      return SizedBox( height: 40, width: MediaQuery.of(context).size.width,
                        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("${(index+1).toString()}."),
                            
                                SizedBox(width: 12,),
                                
                                Icon(Icons.bakery_dining_rounded),
                            
                                SizedBox(width: 12,),
                            
                                Text('croissant ${croissants[index]}')
                              ],
                            ),
                                  
                            IconButton(onPressed: () {
                              deleteCroissants(index);
                            }, icon: Icon(Icons.cancel))
                          ],
                        ),
                      );
                    }
                  ),
                )
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( context,
            MaterialPageRoute(
                builder: (context) => PageTwo(title: widget.title)
            ),
          );
        },
        
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_circle_right_rounded, color: Colors.red[900],),
      ),
    );
  }
}