import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:schoolapp/core/app_export.dart';
import 'package:schoolapp/data/apiClient/getstudent.dart';
import 'package:schoolapp/data/apiClient/getstudymaterial.dart';
import 'package:schoolapp/data/models/student_model.dart';

class StudyMaterial extends StatefulWidget {

  @override
  State<StudyMaterial> createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2BA1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1D3B),
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Row(
          children: [
            Text(
              'Study Material',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 260,
                  color: const Color(0xFF0C1D3B),
                  width: double.infinity,
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Container(
                height: 600,
                width: 500,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    const SizedBox(height: 10,),
                    Container(
                      height: 30,
                      width: 280,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 0.30, color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x0C212121),
                            blurRadius: 1,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'All Subject Study Material',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF515151),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                      ),itemCount: Study.materials.length,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          itemBuilder: (context,index){
                          return MyContainer(topicname: Study.materials[index].topicName,link: Study.materials[index].materialLink,);
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MyContainer extends StatelessWidget {

  final String topicname;
  final String link;

  MyContainer({Key? key, required this.topicname, required this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _launchURL(context,link);
      },
      child: Container(
        width: 80.h,
        height: 73,
        padding: const EdgeInsets.only(top: 6),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F3F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26212121),
              blurRadius: 4,
              offset: Offset(2, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/folder.png')
                ),
              ),
            ),
             SizedBox(height: 6),
            Container(
              width: double.infinity,
              height: 17,
              padding: const EdgeInsets.only(top: 2, left: 28, right: 28),
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                color: Color(0xFF3E5155),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      topicname,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
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


  Future<void> _launchURL(BuildContext context, String url) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WebViewPage(url: url),
    ));
  }
}


class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  StudentBasic? student;
  String loginid = Uri.encodeComponent(AuthenticateUser.studentBasic!.admsnNo.toString());
  String logincode = Uri.encodeComponent(AuthenticateUser.studentBasic!.schoolCode.toString());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String urlWithParams = "${widget.url}?loginid=$loginid&logincode=$logincode";
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Login id:' + AuthenticateUser.studentBasic!.admsnNo.toString(),style: TextStyle(fontSize: 15),),
            Text('Login Code:' + AuthenticateUser.studentBasic!.schoolCode.toString(),style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(urlWithParams)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
          ),
        ),
        onWebViewCreated: (controller) {},
      ),
    );
  }
}

