import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/screens/widget/setting_widgets/language_sheet_widget.dart';
import 'package:todo_app/screens/widget/setting_widgets/setting_menu_container.dart';
import 'package:todo_app/screens/widget/setting_widgets/theme_sheet_widget.dart';

class SettingTab extends StatelessWidget {
  static const String routeName = 'Setting Screen';

  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          SettingMenuContainer(
              text: settingProvider.language == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              widgetFunction: const LanguageSheetWidget()),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          SettingMenuContainer(
              text: settingProvider.themeMode == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark,
              widgetFunction: ThemeSheetWidget()),
        ],
      ),
    );
  }
}
