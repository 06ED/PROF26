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
  });
}
