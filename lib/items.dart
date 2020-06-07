import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
final dbRef = Firestore.instance;

typedef void MapCallback(LatLng callback);

class Items extends StatefulWidget {
  final MapCallback callback;
  Items({Key key, this.title, this.callback}) : super(key: key);

  final String title;
  @override
  _ItemsState createState() => _ItemsState();

}

class _ItemsState extends State<Items> {
  List<dynamic> items = [];
  List<dynamic> itemsFiltered = [];
  Map<String, Color> itemsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();
  String mainText = "";
  @override
  void initState() {
    super.initState();
    getAllItems();
    searchController.addListener(() {
      filterItems();
    });
  }
 List<int> count  = [0,0,0];
    void countAdd(String t){
      setState((){
          if (t == "Water bottles") {
    count[0]++;
  } 
  else if(t == "Hand Sanitizers"){
    count[1]++;
  }
  else if (t == "Toilet Paper"){
    count[2]++;
  }
        mainText = t; 
      });
    }  
    void countSubtract(String t){
      setState((){
      if(count[0] != 0){
        if (t == "Water bottles") {
          count[0]--;
        } 
      }
      if(count[1] != 0){
   if(t == "Hand Sanitizers"){
    count[1]--;
  }
      }
  if(count[2] != 0 ){
   if (t == "Toilet Paper"){
    count[2]--;
  }
  }
      
        mainText = t; 
      });
      
      
    }

  getAllItems() async {
    List colors = [
      Colors.green,
      Colors.indigo,
      Colors.yellow,
    ];
    List itemS = ["Water bottles", "Hand Sanitizers", "Toilet Paper"];
   
    List<int> toilet = new List(7);
    List<int> hand = new List(7);
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
    print(_items);
    print(items);
    
    if (searchController.text.isNotEmpty) {
      
      _items.retainWhere((item) {
        String searchTerm = searchController.text.toLowerCase();
        String itemName = item.toString().toLowerCase();
        bool nameMatches = itemName.contains(searchTerm);
        print(itemName);
        print(searchTerm);
        print(nameMatches);
        print(item);
        if (nameMatches == true) {
          return true;
        }

      });
      print("YES");
      setState(() {
        itemsFiltered = _items;
      });
    }else{
      print("NOT");
      setState(() {
        itemsFiltered = items;
      });
    }
  }
  List<String> water = [];
    List<String> toilet = [];
    List<String> hand = [];
    List<LatLng> latlng = [];
  Future<List> getData() async {
     await dbRef.collection("HtoO").getDocuments().then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((f) => water.add(('${f.data["Water Bottle"]}').toString()));
      });

     await dbRef.collection("HtoO").getDocuments().then((QuerySnapshot snapshot) {
          snapshot.documents.forEach((f) => toilet.add(('${f.data["Toilet Paper"]}').toString()));
        });

    await dbRef.collection("HtoO").getDocuments().then((QuerySnapshot snapshot) {
          snapshot.documents.forEach((f) => hand.add(('${f.data["Toilet Paper"]}').toString()));
        });
  }
  @override
  Widget build(BuildContext context) {
    
    List<String> stores = ["Store 1", "Store 2","Store 3","Store 4","Store 5","Store 6","Store 7"];
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.deepPurple[800],
      //   title: Text("H to O"),
      // ),
      appBar: AppBar(
            elevation: 0,
            title: Text(
              'Shopping List'),
              backgroundColor: Colors.deepPurple[800],
              automaticallyImplyLeading: false,
            
          ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/appbackground.jpg"),
            fit: BoxFit.cover,
          ),
          ),
          padding: EdgeInsets.fromLTRB(7, 16, 7, 30),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                  color: Colors.white,
                ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: TextField(
                  controller: searchController,
                  
                  decoration: InputDecoration(
                    labelStyle: new TextStyle(
                    color: Colors.amber
                ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.black
                      )
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black
                    )
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: isSearching == true ? itemsFiltered.length : items.length,
                  itemBuilder: (context, index) {
                    dynamic essentials = isSearching == true ? itemsFiltered[index] : items[index];
                    
                    var baseColor = itemsColorMap[essentials.toString()] as dynamic;

                    Color color1 = baseColor[800];
                    Color color2 = baseColor[400];
                    print(essentials.toString());
                    return listSectionMethod(essentials.toString(), color1, color2, count);
                  },
                ),
              ),
              SizedBox(
                  width: 140.0,
                  height: 60.0,
                  child: new FlatButton(
                    color: Colors.deepPurple[500],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Icon(Icons.check,

                        color: Colors.white,)


                      ],
                    ),
                    onPressed: () async {
                      await getData();
                      print(water);
                      print(water.length);
                      int x = 7;
                      for(int i = 0; i < x; i++){
                          if(int.parse(water[i]) < count[0]){
                              stores[i] = ".";
                         
                          }
                          else if(int.parse(toilet[i])< count[1]){
                              stores[i] = ".";
                          }
                          else if(int.parse(hand[i]) < count[2]){
                              stores[i] = ".";
                          }
                          print(stores);
                          print(water[i]);
                        
                      }
                      print("AAAAA");
                      print(stores);
                      water.clear();
                      String t = "";
                      for(int i = 0; i < stores.length; i++){
                        if(stores[i] != "."){
                          t = stores[i];
                          break;
                        }
                      }
                      print(t);
                    await dbRef.collection("HtoO").getDocuments().then((QuerySnapshot snapshot) {
                    snapshot.documents.forEach((f) => latlng.add(LatLng(GeoPoint(f.data["Location"].latitude,f.data["Location"].longitude).latitude,GeoPoint(f.data["Location"].latitude,f.data["Location"].longitude).longitude)));
                  });   
      
                    print(latlng);
                    int n = int.parse(t[6]);
                    print(latlng[n-1]);
                    widget.callback(latlng[n-1]);

                    setState(() {
                      count[0] == 0;
                      count[1] == 0;
                      count[2] == 0;
                    });
                      //{StoreID: Latlng}

                      //widget.callback(); //Latlng

            },
                  ),),

              ],
        
      ),
    )
    );
  }
  Text getText(String t, List<int> count) {
  Widget child;
  if (t == "Water bottles") {
    child = Text(count[0].toString());
  } 
  else if(t == "Hand Sanitizers"){
    child = Text(count[1].toString());
  }
  else{
    child = Text(count[2].toString());
  }
  return child;
}

  IconData makeIcon(String t){
  switch(t){
    case "W":return Icons.invert_colors;
    case "H": return Icons.local_hospital;
    case "T": return Icons.wc;
  }
  }
  Card listSectionMethod(String title, Color color1, Color color2, List<int> count) {
    return new Card(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
      child: ListTile(
          title: Text(title.toString()),
          subtitle: getText(title, count),
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
                child: Icon(
                  makeIcon(title[0]),
                ),
                backgroundColor: Colors.transparent
              )
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: (){ countSubtract(title);}, 
                  child: Icon(Icons.remove)),
                FlatButton(
                  onPressed: (){countAdd(title);
                  print(count.toString());}, 
                  child: Icon(Icons.add)),
              ],            
        ),
      )
    );
}
  }
