import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/screens/widget/language_sheet_widget.dart';
import 'package:todo_app/screens/widget/setting_menu_container.dart';
import 'package:todo_app/screens/widget/theme_sheet_widget.dart';

class SettingTab extends StatelessWidget {
  static const String routeName = 'Setting Screen';

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
          SizedBox(
            height: 20,
          ),
          SettingMenuContainer(
              text: settingProvider.language == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              widgetFunction: LanguageSheetWidget()),
          SizedBox(height: 20),
          Text(
            'Mode',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 20),
          SettingMenuContainer(
              text: settingProvider.themeMode == ThemeMode.light
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark,
              widgetFunction: ThemeSheetWidget()),
          SizedBox(height: 40),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     border: Border.all(color: Theme.of(context).colorScheme.primary),
          //   ),
          //   child: Row(
          //     children: [
          //       Text(
          //         'test',
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleSmall!
          //             .copyWith(color: Theme.of(context).colorScheme.primary),
          //       ),
          //       Spacer(),
          //       IconButton(onPressed: () {
          //        showModalBottomSheet(context: context, builder: (context) {
          //          return ThemeSheetWidget();
          //        },);
          //       }, icon: Icon(Icons.arrow_drop_down, size: 30, color: Theme.of(context).colorScheme.primary,),),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
