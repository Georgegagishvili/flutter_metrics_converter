import 'package:flutter/material.dart';
import 'package:tasktwo/widget/buttons/main_button.dart';

class _HomePageState extends State<HomePage> {
  String? _fromValue;
  String? _toValue;
  double _convertedValue = 0.0;
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  final Map<String, dynamic> _values = {
    'cm': {
      'cm': 1,
      'km': 100000,
      'm': 100,
    },
    'm': {
      'm': 1,
      'km': 1000,
      'cm': 0.01,
    },
    'km': {'cm': 0.00001, 'm': 0.001, 'km': 1}
  };

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => {_focusNode.unfocus()},
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Metrics Converter",
            style: TextStyle(
                color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(top: 40, right: 50, left: 50),
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Number:",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _textEditingController,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                              filled: true,
                              enabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[100]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: MediaQuery.of(context).size.width / 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "From",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                iconEnabledColor: Colors.blue,
                                iconSize: 30,
                                dropdownColor: Colors.white,
                                value: _fromValue,
                                onChanged: (onValue) {
                                  setState(() {
                                    _fromValue = onValue.toString();
                                  });
                                },
                                items: _values.keys
                                    .map((e) => DropdownMenuItem(
                                          child: Text(
                                            '$e',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),
                              )))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: MediaQuery.of(context).size.width / 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "To",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          Container(
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                iconEnabledColor: Colors.blue,
                                iconSize: 30,
                                dropdownColor: Colors.white,
                                value: _toValue,
                                onChanged: (onValue) {
                                  setState(() {
                                    _toValue = onValue.toString();
                                  });
                                },
                                items: _values.keys
                                    .map((e) => DropdownMenuItem(
                                          child: Text(
                                            '$e',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),
                              )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Result:",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue),
                    child: Text(
                      '$_convertedValue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              MainButton(
                label: 'CONVERSION',
                action: () {
                  _convertValue();
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              MainButton(
                label: 'RESET',
                action: () => _resetFields(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _convertValue() {
    setState(() {
      if (_fromValue == null ||
          _toValue == null ||
          _textEditingController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Please Fill Empty Fields")));
      } else if (RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$')
          .hasMatch(_textEditingController.text)) {
        _convertedValue = double.parse(_textEditingController.text) /
            _values[_fromValue][_toValue];
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Format Of Number")));
      }
    });
  }

  void _resetFields() {
    setState(() {
      _textEditingController.clear();
      _toValue = null;
      _fromValue = null;
      _convertedValue = 0.0;
      _focusNode.unfocus();
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
