import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class LanguageSheetWidget extends StatelessWidget {
  LanguageSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: languageProvider.language == 'en'
                      ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary)
                      : Theme.of(context).textTheme.bodyMedium,
                ),
                Spacer(),
                Visibility(
                  visible: languageProvider.language == 'en' ? true : false,
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: languageProvider.language == 'en'
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: languageProvider.language == 'ar'
                      ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary)
                      : Theme.of(context).textTheme.bodyMedium,
                ),
                Spacer(),
                Visibility(
                  visible: languageProvider.language == 'ar' ? true : false,
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: languageProvider.language == 'ar'
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
