

import 'package:news_app/src/models/countries.dart';
import 'package:news_app/src/ui/pages.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SizedBox(
        width:double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Padding(
              padding:  EdgeInsets.only(top: 10.0),
              child:  Text("Select country",
              style:  TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w700
                ), 
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Country.countries.length,
                itemBuilder: (context, index) {
                  final Country country = Country.countries[index];
                  return ListTile(
                    onTap: () => print(country.countryPrefix.toLowerCase()),
                    leading: Image.asset(country.countryImage, height: 35, width: 35, filterQuality: FilterQuality.high),
                    title: Text(country.countryNameEN),
                    trailing: const Icon(Icons.check, color: Colors.green,),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}