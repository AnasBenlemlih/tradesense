import 'package:flutter/material.dart';
import 'package:tradesense/widget/TitleHeader.dart';

class DetailsTarif extends StatefulWidget {
  //final List<String> columns;
  final List<Map<String, String>> listOfRows;
  final List<String> listOfColumns;
    final List<String> list;


  const DetailsTarif({Key key, this.listOfRows, this.listOfColumns, this.list}) : super(key: key);




  @override
  _DetailsTarifState createState() => _DetailsTarifState();
}

class _DetailsTarifState extends State<DetailsTarif> {
  final controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(   
           
       //  scrollDirection: Axis.horizontal,      
        controller: controller,
        child: Column(

          children: <Widget>[
            TitleHeader(
              titre: "Tarif douanier ",
              offset: 0,
              color1: 0xFFD23669,
              color2: 0xFFD23669,
              size: 160,
            ),  
             SizedBox(height: 20.0),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               controller: controller,
               child: Row(
                 children: <Widget>[
                     Container(
               alignment: Alignment.topLeft,
               child: DataTable(
               
                columns: 
                
                   widget.listOfColumns.map((e) => DataColumn(label: Text(e))).toList(),            
     
                rows: 
                 widget.listOfRows // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(cells: 
                widget.list.map((e) => 
                  DataCell(Text(element[e])),   
                 ).toList()
                    )),
              )
              .toList(),
                ),
             ),
                 ],
               ),
             ) ],
        ),
        ),
    ); 
  }
}