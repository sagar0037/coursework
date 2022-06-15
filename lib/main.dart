import 'package:flutter/material.dart';
import 'package:readerapp/ReaderScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Chapter Reader App',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  final List<String> chapterList = [
    'Ch 1',
    'Ch 2',
    'Ch 3',
    'Ch 4',
    'Ch 5',
    'Ch 6',
    'Ch 7',
    'Ch 8',
    'Ch 9'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter Reader'),
        backgroundColor: Color(0xFFB03A2E),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0
          ),
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                if(chapterList[index]=='Ch 1'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ReaderScreen(1)),
                  );
                }
                else{
                  print('This is also success');
                }
              },
              child: Card(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Icon(Icons.book, size: 40,),
                    SizedBox(height: 5,),
                    Text(chapterList[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            );
          },
          itemCount: chapterList.length,
        ),
      ),
    );
  }
}
