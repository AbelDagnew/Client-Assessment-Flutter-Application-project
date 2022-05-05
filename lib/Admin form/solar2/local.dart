import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';
import './translations/locale_keys.g.dart';


class Local extends StatefulWidget {


  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> {
  String _value ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        : Padding(
          padding: EdgeInsets.all(8.0),
          child: DropdownButton(
            value: _value,

            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                child: Text('🏴󠁧󠁢󠁥󠁮󠁧󠁿 English',),
                value: 'one',
                onTap: () async {
                  await context.setLocale(Locale('en'));
                },

              ),
              DropdownMenuItem(
                child: Text("🇪🇹 አማርኛ",),
                value: 'two',
                onTap: () async {
                  await context.setLocale(Locale('am'));
                },
              )
            ],
            onChanged: (value) async {
              setState(() {
                _value = value;
              });
            },
          ),
        )

    );
  }
}
