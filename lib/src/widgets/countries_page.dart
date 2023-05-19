import 'package:news_app/src/ui/pages.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                controller: Provider.of<GeneralSettingsProvider>(context).countryController,
                itemCount: Country.countries.length,
                itemBuilder: (context, index) {
                  final NewsService newsService = Provider.of<NewsService>(context);
                  final GeneralSettingsProvider generalSettingsProvider = Provider.of<GeneralSettingsProvider>(context);
                  final Country country = Country.countries[index];
                  return ListTile(
                    onTap: () async {
                       newsService.setSelectedCountry = country.countryPrefix.toLowerCase();
                       await newsService.getNewsByCountry(newsService.selectedCountry);
                       generalSettingsProvider.setCurrentCountryScrollPosition = generalSettingsProvider.countryController.offset;
                    },
                    leading: Image.asset(country.countryImage, height: 35, width: 35, filterQuality: FilterQuality.high),
                    title: Text(country.countryNameEN,style:  TextStyle(color: country.countryPrefix.toLowerCase() == newsService.selectedCountry ? Colors.green.shade900 : Colors.white),),
                    trailing: country.countryPrefix.toLowerCase() == newsService.selectedCountry ?  const Icon(Icons.check, color: Colors.green,) : null,
                    selected: true,
                    selectedTileColor: country.countryPrefix.toLowerCase() == newsService.selectedCountry ? Colors.green.shade100 : null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }  
  // @override
  // bool get wantKeepAlive => true;
}