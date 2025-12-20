import 'package:flutter/material.dart';
import 'package:open_router_query/open_router_query.dart';

class HomePage extends StatefulWidget {
  final QueryUseCase _queryUseCase = QueryUseCase();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textFieldController = TextEditingController();
  String? _error;
  String? _completion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 24,
          children: [
            if (_error != null)
              Text(_error!, style: TextStyle(color: Colors.red)),
            TextField(controller: _textFieldController),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      widget._queryUseCase.getCompletion(
                        content: _textFieldController.text,
                        onResponse: (String text) {
                          setState(() {
                            _completion = text;
                          });
                        },
                        onError: (String errorText) {
                          setState(() {
                            _error = errorText;
                          });
                        },
                      );

                      setState(() {
                        _error = null;
                        _completion = null;
                      });

                      _textFieldController.clear();
                    },
                    child: Text("Get completion"),
                  ),
                ),
              ],
            ),
            if (_completion != null) Text(_completion!),
          ],
        ),
      ),
    );
  }
}
