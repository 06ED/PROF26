import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:open_router_query/open_router_query.dart';

class HomePage extends StatefulWidget {
  final QueryUseCase _queryUseCase = QueryUseCase();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _modelsDropdownKey = GlobalKey<DropdownSearchState>();

  final _textFieldController = TextEditingController();

  String? _errorText;
  String? _completionText;

  Future<List<AIModel>> _getAIModelsList() async {
    late List<AIModel> modelsList;

    await widget._queryUseCase.getAIModelsList(
      onResponse: (responseList) {
        modelsList = responseList;
      },
      onError: (errorText) {
        modelsList = [];
      },
    );

    return modelsList;
  }

  bool _getCompletionValidation() {
    dynamic currentModel = _modelsDropdownKey.currentState?.getSelectedItem;

    return _textFieldController.text.isNotEmpty && currentModel != null;
  }

  void _getCompletion() async {
    AIModel currentModel = _modelsDropdownKey.currentState?.getSelectedItem;

    await widget._queryUseCase.getCompletion(
      content: _textFieldController.text,
      model: currentModel.id,
      onResponse: (responseText) {
        setState(() {
          _errorText = null;
          _completionText = responseText;
        });
      },
      onError: (errorText) {
        setState(() {
          _errorText = errorText;
          _completionText = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: .symmetric(vertical: 24),
          child: Center(child: Text("OpenRouterQuery")),
        ),
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(24),
            child: Column(
              spacing: 24,
              children: [
                if (_errorText != null)
                  Text(
                    "An error occurred: ${_errorText!}",
                    style: TextStyle(color: Colors.red),
                  ),
                TextField(
                  onChanged: (_) => setState(() {}),
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    labelText: "Your request",
                    border: OutlineInputBorder(),
                  ),
                ),
                DropdownSearch<AIModel>(
                  key: _modelsDropdownKey,
                  items: (_, _) => _getAIModelsList(),
                  itemAsString: (item) => item.toString(),
                  compareFn: (firstItem, secondItem) =>
                      firstItem.isEqual(secondItem),
                  popupProps: PopupProps.menu(
                    fit: FlexFit.loose,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        labelText: "Search",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      labelText: "AI Model",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: _getCompletionValidation()
                            ? _getCompletion
                            : null,
                        child: Text("Get completion"),
                      ),
                    ),
                  ],
                ),
                if (_completionText != null)
                  Text(_completionText!, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
