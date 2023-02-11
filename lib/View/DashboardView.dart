import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(

        leading: Icon(Icons.menu, color: Colors.blue.shade900,),
        title: Text('Dashboard', style: TextStyle(color: Colors.blue.shade900),textAlign: TextAlign.left,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        actions:  [

          Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(Icons.account_circle_rounded, color: Colors.blue.shade900,)),
        ],
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 7,
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade200,
        padding: EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                       child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                         child: Center(child: Text("Medical Calculators")),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: Center(child: Text("View Profiles")),

                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: Center(child: Text("Guidelines")),

                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: Center(child: Text("New Profile")),

                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
