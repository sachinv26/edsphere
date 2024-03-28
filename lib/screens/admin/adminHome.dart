import 'package:flutter/material.dart';

import 'createStudent.dart';

class AdminHomeScreen extends StatelessWidget {


   AdminHomeScreen({Key? key}) : super(key: key);

 final List<Color> color = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.amber,
      Colors.deepOrange,
      Colors.lightBlue,
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.redAccent,
      Colors.tealAccent,
      Colors.indigoAccent,
      Colors.amberAccent,
      Colors.deepOrangeAccent,
      Colors.lightBlueAccent,
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1.5,
          children: [
            _buildFeatureButton(
              context,
              title: 'Create Student',
              i:  1,
              //color: Colors.blue,
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentFormPage()));
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Add Event',
              i:  2,
              // color: Colors.green,
              onTap: () {
                // Navigate to add event screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Update Attendance',
              i:  3,
              //  color: Colors.orange,
              onTap: () {
                // Navigate to update attendance screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Fees',
              i:  4,
              // color: Colors.purple,
              onTap: () {
                // Navigate to fees screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Birthday',
              i:  5,
              // color: Colors.red,
              onTap: () {
                // Navigate to birthday screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Update Marks',
              i:  6,
              // color: Colors.teal,
              onTap: () {
                // Navigate to update marks screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Add Resources',
              i:  7,
              // color: Colors.indigo,
              onTap: () {
                // Navigate to add resources screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Add Homework',
              i:  1,
              // color: Colors.amber,
              onTap: () {
                // Navigate to add homework screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Notifications',
              i:  8,
              // color: Colors.deepOrange,
              onTap: () {
                // Navigate to notifications screen
              },
            ),
            _buildFeatureButton(
              context,
              title: 'Notices',
             i:  9,
              // color: Colors.lightBlue,
              onTap: () {
                // Navigate to notices screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
      BuildContext context, {
        required int i,
        required String title,
    //    required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color[i].withOpacity(0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


}
