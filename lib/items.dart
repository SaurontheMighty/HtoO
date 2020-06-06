import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  Items({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ItemsState createState() => _ItemsState();

}

class _ItemsState extends State<Items> {
  List<dynamic> items = [];
  List<dynamic> itemsFiltered = [];
  Map<String, Color> itemsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllItems();
    searchController.addListener(() {
      filterItems();
    });
  }
 int count  = 0;
    void countAdd(){
      setState((){
        count++;
        
      });
    }  
    void countSubtract(){
      setState((){
        count--;
        
      });
      
    }

  getAllItems() async {
    List colors = [
      Colors.green,
      Colors.indigo,
      Colors.yellow,
    ];
    List itemS = ["Water bottles", "Hand Sanitizer", "Toilet Papers"];
    int colorIndex = 0;
    List<dynamic> _items = itemS;
    _items.forEach((item) {
      print("BBBBBBB");
      print(item.toString());
      Color baseColor = colors[colorIndex];
      itemsColorMap[item.toString()] = baseColor;
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
    });
    setState(() {
      items = _items;
      print(items);
    });
  }

  filterItems() {
    List<dynamic> _items = [];
    _items.addAll(items);
    print("AAAAAAAAAAAAAAAAAA");
    print(_items);
    print(items);
    
    if (searchController.text.isNotEmpty) {
      
      _items.retainWhere((item) {
        String searchTerm = searchController.text.toLowerCase();
        String itemName = item.toString().toLowerCase();
        bool nameMatches = itemName.contains(searchTerm);
        
        if (nameMatches == true) {
          return true;
        }

      });

      setState(() {
        itemsFiltered = _items;
      });
    }else{
      setState(() {
        itemsFiltered = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
   
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 7, 5, 20),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Theme.of(context).primaryColor
                    )
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor
                  )
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: isSearching == true ? itemsFiltered.length : items.length,
                itemBuilder: (context, index) {
                  dynamic essentials = isSearching == true ? itemsFiltered[index] : items[index];
                  
                  var baseColor = itemsColorMap[essentials.toString()] as dynamic;

                  Color color1 = baseColor[800];
                  Color color2 = baseColor[400];
                  
                  return listSectionMethod(essentials.toString(), color1, color2, count);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Card listSectionMethod(String title, Color color1, Color color2, int count) {
    return new Card(
      child: ListTile(
          title: Text(title.toString()),
          subtitle: Text(
            title == "Water bottles" ?count.toString(): "0"
          ),
          leading: 
            // CircleAvatar(
            //   backgroundImage: add image for later maybe??,
            // ) : 
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    color1,
                    color2,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight
                )
              ),
              child: CircleAvatar(
                child: Text(
                  title[0],
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                backgroundColor: Colors.transparent
              )
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: (){ countSubtract();}, 
                  child: Icon(Icons.remove)),
                FlatButton(
                  onPressed: (){countAdd();
                  print(count.toString());}, 
                  child: Icon(Icons.add)),
              ],            
        ),
        
        
    )
    );
}



}