import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main()=>runApp(Date_p());

class Date_p extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }

}

class homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _homepagestate();
  }
}

class _homepagestate extends State<homepage>{
DateTime _currentdate=DateTime.now();
Future<Null>_datechange(BuildContext context) async{
  final DateTime? _datechange= await showDatePicker(
      context: context,
      initialDate:_currentdate,
      firstDate: DateTime(2001),
      lastDate: _currentdate);
   if(_datechange!=null){
  setState((){
    _currentdate=_datechange;
  }
  );
}
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String _formatdate=DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Date Picker",style: TextStyle(fontSize: 20,color: Colors.white),),),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 300,left: 70,right: 50),
        child:Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text("Date:$_formatdate")
                ),
                Expanded(child: IconButton(
                  onPressed: (){
                    _datechange(context);
                  },
                  icon: Icon(Icons.date_range,size: 50,color: Colors.yellow,),
                ),)
              ],
            )

          ],
        )
      ),
    );
  }
}