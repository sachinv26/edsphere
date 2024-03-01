// import 'package:flutter/material.dart';
// import 'package:schoolapp/screens/mainfees.dart';
// import 'package:schoolapp/mainpage.dart';
// import 'package:schoolapp/screens/payment_methods.dart';
//
// class PayFees extends StatefulWidget {
//   const PayFees({Key? key}) : super(key: key);
//
//   @override
//   State<PayFees> createState() => _PayFeesState();
// }
//
// class _PayFeesState extends State<PayFees> {
//   List<bool> academicFeeCheckBoxValues =
//       List.generate(12, (index) => index != 0);
//   List<bool> transportCheckBoxValues = List.generate(12, (index) => index != 0);
//
//   int paidMonth = 4; // Set the month for which fees are paid (e.g., April)
//   int _currentIndex = 0;
//   // Added _currentIndex variable
//   bool _isChecked = false;
//
//   bool _isqr =false;
//   bool _isother=false;
//   void _showOldBalanceDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Container(
//             color: const Color(0xFF02335F),
//             alignment: Alignment.topCenter,
//             child: const Text(
//               'Old Balance',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           content: const Row(
//             children: [
//               Text(
//                 'Your Old Balance is',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF445154),
//                   fontSize: 16,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 '₹900.00',
//                 style: TextStyle(
//                   color: Color(0xFFDB2C0B),
//                   fontSize: 20,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             Center(
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(horizontal: 72, vertical: 6),
//                   ),
//                   backgroundColor: MaterialStateProperty.all(const Color(0xFF02335F)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   shadowColor: MaterialStateProperty.all(const Color(0x14212121)),
//                   elevation: MaterialStateProperty.all(1),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Close'),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showpaymentbanner(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero, // Set contentPadding to zero
//           content: Padding(
//             padding: const EdgeInsets.all(8.0), // Add padding to the Column
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
//               children: [
//                 Image.asset('assets/icons/payment.png'),
//                 const Divider(thickness: 3),
//                 const Text(
//                   'Please select any one option for payment mode.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF02335F),
//                     fontSize: 10,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Checkbox(
//                       activeColor: Colors.white,
//                       checkColor: Colors.black,
//                       value:
//                       _isqr, // Add a boolean variable to track the checkbox state
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _isqr = value ?? false;
//                         });
//                       },
//                     ),
//                     const Text(
//                       'Do you want to Pay Fee by QR code.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF445154),
//                         fontSize: 10,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Checkbox(
//                       activeColor: Colors.white,
//                       checkColor: Colors.black,
//                       value:
//                       _isother, // Add a boolean variable to track the checkbox state
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _isother = value ?? false;
//                         });
//                       },
//                     ),
//                     const Text(
//                       'Do you want to Pay Fee by other option.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF445154),
//                         fontSize: 10,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           actions: [
//             Center(
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(horizontal: 72, vertical: 6),
//                   ),
//                   backgroundColor: MaterialStateProperty.all(const Color(0xFF02335F)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   shadowColor: MaterialStateProperty.all(const Color(0x14212121)),
//                   elevation: MaterialStateProperty.all(1),
//                 ),
//                 onPressed: () {
//                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>PaymentMethods()));
//                 },
//                 child: const Text('Continue to pay'),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF0C1D3B),
//         elevation: 0,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return const BackButton();
//           },
//         ),
//         title: const Row(
//           children: [
//             Text(
//               'Fees Paid',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.w600,
//                 height: 0,
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: const Color(0xFFF2BA1B),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: 260,
//                         color: const Color(0xFF0C1D3B),
//                         width: double.infinity,
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 10.0, left: 10.0, right: 10.0),
//                     child: Container(
//                       margin: const EdgeInsets.all(4),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Select Month',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w500,
//                                     height: 0,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Old Bal :',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '₹900',
//                                       style: TextStyle(
//                                         color: Color(0xFFFF2800),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(left: 5, right: 5),
//                             height: 44,
//                             width: 450,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Choose Month',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                       fontFamily: 'Poppins',
//                                       fontWeight: FontWeight.w500,
//                                       height: 0,
//                                     ),
//                                   ),
//                                   Icon(Icons.arrow_drop_down)
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _currentIndex = 0;
//                                     });
//                                   },
//                                   child: Container(
//                                     width: 150,
//                                     height: 32,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8, vertical: 4),
//                                     decoration: ShapeDecoration(
//                                       color: _currentIndex == 0
//                                           ? const Color(0xFF02335F)
//                                           : Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 1,
//                                             color: _currentIndex == 0
//                                                 ? Colors.white
//                                                 : const Color(0xFF02335F)),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       shadows: [
//                                         const BoxShadow(
//                                           color: Color(0x26212121),
//                                           blurRadius: 4,
//                                           offset: Offset(2, 2),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         'Academic Fee',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           color: _currentIndex == 0
//                                               ? Colors.white
//                                               : const Color(0xFF02335F),
//                                           fontSize: 16,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w600,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _currentIndex = 1;
//                                     });
//                                   },
//                                   child: Container(
//                                     width: 95,
//                                     height: 32,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8, vertical: 4),
//                                     decoration: ShapeDecoration(
//                                       color: _currentIndex == 1
//                                           ? const Color(0xFF02335F)
//                                           : Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 1,
//                                             color: _currentIndex == 1
//                                                 ? Colors.white
//                                                 : const Color(0xFF02335F)),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       shadows: [
//                                         const BoxShadow(
//                                           color: Color(0x26212121),
//                                           blurRadius: 4,
//                                           offset: Offset(2, 2),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         'Transport',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           color: _currentIndex == 1
//                                               ? Colors.white
//                                               : const Color(0xFF02335F),
//                                           fontSize: 16,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w600,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     // Handle Old Bal tap
//                                     _showOldBalanceDialog(context);
//                                   },
//                                   child: Container(
//                                     width: 95,
//                                     height: 32,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8, vertical: 4),
//                                     decoration: ShapeDecoration(
//                                       color: const Color(0xFF02335F),
//                                       shape: RoundedRectangleBorder(
//                                         side: const BorderSide(
//                                             width: 1, color: Color(0xFF02335F)),
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       shadows: [
//                                         const BoxShadow(
//                                           color: Color(0x26212121),
//                                           blurRadius: 4,
//                                           offset: Offset(2, 2),
//                                           spreadRadius: 0,
//                                         )
//                                       ],
//                                     ),
//                                     child: const Center(
//                                       child: Text(
//                                         'Old Bal',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.w600,
//                                           height: 0,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.all(15),
//                             decoration: ShapeDecoration(
//                                 color: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             height: 128,
//                             width: 360,
//                             child: const Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Total Academic Fees',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF02335F),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '35175.00',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF606060),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Paid Fees',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF02335F),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '35175.00',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF606060),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Balance Fees',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF02335F),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '0.00',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF606060),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 height: 76,
//                                 width: 160,
//                                 child: const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Paid Months',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFFDB2C0B),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       'Apr, May, June',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF322924),
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 height: 76,
//                                 width: 160,
//                                 child: const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Transport Name',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFFDB2C0B),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       ' Apr, May, June',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF322924),
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 height: 76,
//                                 width: 160,
//                                 child: const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Academic Fee',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFFDB2C0B),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '1300.00',
//                                       style: TextStyle(
//                                         color: Color(0xFF515151),
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 height: 76,
//                                 width: 160,
//                                 child: const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Transport Fees',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFFDB2C0B),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '900.00',
//                                       style: TextStyle(
//                                         color: Color(0xFF515151),
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 height: 76,
//                                 width: 160,
//                                 child: const Column(
//
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Old Balance',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFFDB2C0B),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '900.00',
//                                       style: TextStyle(
//                                         color: Color(0xFF515151),
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 height: 76,
//                                 width: 160,
//                                 child: const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Total Pay Fees',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Color(0xFF009818),
//                                         fontSize: 16,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w500,
//                                         height: 0,
//                                       ),
//                                     ),
//                                     Text(
//                                       '3100.00',
//                                       style: TextStyle(
//                                         color: Color(0xFF009818),
//                                         fontSize: 14,
//                                         fontFamily: 'Poppins',
//                                         fontWeight: FontWeight.w400,
//                                         height: 0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                     activeColor: Colors.white,
//                     checkColor: Colors.black,
//                     value:
//                         _isChecked, // Add a boolean variable to track the checkbox state
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _isChecked = value ?? false;
//                       });
//                     },
//                   ),
//                   const Text(
//                     'I accept the terms and conditions.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(horizontal: 72, vertical: 6),
//                   ),
//                   backgroundColor: MaterialStateProperty.all(const Color(0xFF02335F)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   shadowColor: MaterialStateProperty.all(const Color(0x14212121)),
//                   elevation: MaterialStateProperty.all(1),
//                 ),
//                 onPressed: () {
//                   _showpaymentbanner(context);
//                 },
//                 child: const Text(
//                   'Pay Fees Now',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                     letterSpacing: -0.30,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
