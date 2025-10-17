import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:prof_26_uikit/prof_26_uikit.dart";

void main() {
  group("Widgets", () {
    testWidgets("BigButtonWidget", (WidgetTester tester) async {
      late CustomTheme theme;
      final String text = "TestString";
      await tester.pumpWidget(
        MaterialAppWrapper(
          widget: Builder(
            builder: (BuildContext context) {
              theme = CustomTheme.of(context);
              return BigButtonWidget.filled(
                theme: theme,
                onTap: () {},
                text: text,
              );
            },
          ),
        ),
      );

      Text textWidget = tester.firstWidget(find.byType(Text));
      expect(textWidget.data, text, reason: "Text");

      FilledButton button = tester.firstWidget(find.byType(FilledButton));
      expect(
        button.style!.backgroundColor?.resolve({}),
        theme.palette.accent,
        reason: "Filled BackgroundColor",
      );

      await tester.restoreFrom(TestRestorationData.empty);
      await tester.pumpWidget(
        MaterialAppWrapper(
          widget: Builder(
            builder: (BuildContext context) {
              theme = CustomTheme.of(context);
              return BigButtonWidget.filled(
                theme: theme,
                onTap: null,
                text: text,
              );
            },
          ),
        ),
      );

      button = tester.firstWidget(find.byType(FilledButton));
      expect(
        button.style!.backgroundColor?.resolve({WidgetState.disabled}),
        theme.palette.accentInactive,
        reason: "Filled Disabled BackgroundColor",
      );

      await tester.restoreFrom(TestRestorationData.empty);
      await tester.pumpWidget(
        MaterialAppWrapper(
          widget: Builder(
            builder: (BuildContext context) {
              theme = CustomTheme.of(context);
              return BigButtonWidget.simple(
                theme: theme,
                onTap: () {},
                text: text,
              );
            },
          ),
        ),
      );

      button = tester.firstWidget(find.byType(FilledButton));
      expect(
        button.style!.backgroundColor?.resolve({}),
        theme.palette.inputBackground,
        reason: "Simple BackgroundColor",
      );
    });
    testWidgets("TabbarWidget", (WidgetTester tester) async {
      final int currentIndex = 0;
      await tester.pumpWidget(
        MaterialAppWrapper(
          widget: Builder(
            builder: (BuildContext context) {
              return TabbarWidget(
                onTap: (int index) {},
                currentIndex: currentIndex,
              );
            },
          ),
        ),
      );
      BottomNavigationBar tabbar = tester.firstWidget(
        find.byType(BottomNavigationBar),
      );
      expect(tabbar.currentIndex, currentIndex, reason: "Tabbar CurrentIndex");
    });
    testWidgets("InputWidget", (WidgetTester tester) async {
      late final CustomTheme theme;
      final String controllerText = "test";
      await tester.pumpWidget(
        MaterialAppWrapper(
          widget: Builder(
            builder: (BuildContext context) {
              theme = CustomTheme.of(context);
              return InputWidget(
                label: "",
                hint: "",
                error: "error",
                controller: TextEditingController(text: controllerText),
              );
            },
          ),
        ),
      );
      TextField textField = tester.firstWidget(find.byType(TextField));
      expect(
        textField.decoration!.fillColor,
        theme.palette.error.withValues(alpha: 0.1),
        reason: "ErrorInputWidget BackgroundColor",
      );
      expect(
        textField.decoration!.enabledBorder!.borderSide.color,
        theme.palette.error,
        reason: "ErrorInputWidget StrokeColor",
      );
      expect(
        textField.controller!.text,
        controllerText,
        reason: "ErrorInputWidget ControllerText",
      );
    });
  });
}
