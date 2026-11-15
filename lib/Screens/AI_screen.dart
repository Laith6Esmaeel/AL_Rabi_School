import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/AI_Controller.dart';
import 'package:shcool/Customs/Custom_TextF.dart';

class AiScreen extends StatefulWidget {
  final Color mainColor;
  const AiScreen({super.key, required this.mainColor});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  TextEditingController controller = TextEditingController();

  String answer = "";

  void _talkToChat() async {
    String theAnswer = await getOpenRouterResponse(controller.text);
    setState(() {
      answer = theAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('94'.tr),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              '95'.tr,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            text: '96'.tr,
            textEditingController: controller,
            icon: Icons.add_to_home_screen,
            
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            answer,
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: FloatingActionButton(
              onPressed: _talkToChat,
              backgroundColor: widget.mainColor,
              tooltip: 'Increment',
              child: Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }
}
