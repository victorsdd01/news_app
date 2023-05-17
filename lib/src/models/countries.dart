

enum CountryBasePath{
  coutryPath("assets/icons/countries/");
  final String countryImage;
  const CountryBasePath(this.countryImage);
}

class Country{

  String countryImage;
  String countryNameES;
  String countryNameEN;
  String countryPrefix;

  Country({
    required this.countryImage,
    required this.countryNameES,
    required this.countryNameEN,
    required this.countryPrefix
  });



  static List<Country> countries = [
    Country(
      countryNameES: "Emiratos Árabes Unidos",
      countryNameEN: "United Arab Emirates",
      countryPrefix: "AE", 
      countryImage: '',
    ),
    Country(
      countryNameES: "Argentina",
      countryNameEN: "Argentina",
      countryPrefix: "AR",
      countryImage: '',
    ),
    Country(
      countryNameES: "Austria",
      countryNameEN: "Austria",
      countryPrefix: "AT",
      countryImage: '',
    ),
    Country(
      countryNameES: "Australia",
      countryNameEN: "Australia",
      countryPrefix: "AU",
      countryImage: '',
    ),
    Country(
      countryNameES: "Bélgica",
      countryNameEN: "Belgium",
      countryPrefix: "BE",
      countryImage: '',
    ),
    Country(
      countryNameES: "Bulgaria",
      countryNameEN: "Bulgaria",
      countryPrefix: "BG",
      countryImage: '',
    ),
    Country(
      countryNameES: "Brasil",
      countryNameEN: "Brazil",
      countryPrefix: "BR",
      countryImage: '',
    ),
    Country(
      countryNameES: "Canadá",
      countryNameEN: "Canada",
      countryPrefix: "CA",
      countryImage: '',
    ),
    Country(
      countryNameES: "Suiza",
      countryNameEN: "Switzerland",
      countryPrefix: "CH",
      countryImage: '',
    ),
    Country(
      countryNameES: "China",
      countryNameEN: "China",
      countryPrefix: "CN",
      countryImage: '',
    ),
    Country(
      countryNameES: "Colombia",
      countryNameEN: "Colombia",
      countryPrefix: "CO",
      countryImage: '',
    ),
    Country(
      countryNameES: "Cuba",
      countryNameEN: "Cuba",
      countryPrefix: "CU",
      countryImage: '',
    ),
    Country(
      countryNameES: "República Checa",
      countryNameEN: "Czech Republic",
      countryPrefix: "CZ",
      countryImage: '',
    ),
    Country(
      countryNameES: "Alemania",
      countryNameEN: "Germany",
      countryPrefix: "DE",
      countryImage: '',
    ),
    Country(
      countryNameES: "Egipto",
      countryNameEN: "Egypt",
      countryPrefix: "EG",
      countryImage: '',
    ),
    Country(
      countryNameES: "Francia",
      countryNameEN: "France",
      countryPrefix: "FR",
      countryImage: '',
    ),
    Country(
      countryNameES: "Reino Unido",
      countryNameEN: "United Kingdom",
      countryPrefix: "GB",
      countryImage: '',
    ),
    Country(
      countryNameES: "Grecia",
      countryNameEN: "Greece",
      countryPrefix: "GR",
      countryImage: '',
    ),
    Country(
      countryNameES: "Hong Kong",
      countryNameEN: "Hong Kong",
      countryPrefix: "HK",
      countryImage: '',
    ),
    Country(
      countryNameES: "Hungría",
      countryNameEN: "Hungary",
      countryPrefix: "HU",
      countryImage: '',
    ),
    Country(
      countryNameES: "Indonesia",
      countryNameEN: "Indonesia",
      countryPrefix: "ID",
      countryImage: '',
    ),
    Country(
      countryNameES: "Irlanda",
      countryNameEN: "Ireland",
      countryPrefix: "IE",
      countryImage: '',
    ),
    Country(
    countryNameES: "Israel",
    countryNameEN: "Israel",
    countryPrefix: "IL",
    countryImage: '',
    ),
    Country(
    countryNameES: "India",
    countryNameEN: "India",
    countryPrefix: "IN",
    countryImage: '',
    ),
    Country(
    countryNameES: "Italia",
    countryNameEN: "Italy",
    countryPrefix: "IT",
    countryImage: '',
    ),
    Country(
    countryNameES: "Japón",
    countryNameEN: "Japan",
    countryPrefix: "JP",
    countryImage: '',
    ),
    Country(
    countryNameES: "Corea del Sur",
    countryNameEN: "South Korea",
    countryPrefix: "KR",
    countryImage: '',
    ),
    Country(
    countryNameES: "Lituania",
    countryNameEN: "Lithuania",
    countryPrefix: "LT",
    countryImage: '',
    ),
    Country(
    countryNameES: "Letonia",
    countryNameEN: "Latvia",
    countryPrefix: "LV",
    countryImage: '',
    ),
    Country(
    countryNameES: "Marruecos",
    countryNameEN: "Morocco",
    countryPrefix: "MA",
    countryImage: '',
    ),
    Country(
    countryNameES: "México",
    countryNameEN: "Mexico",
    countryPrefix: "MX",
    countryImage: '',
    ),
    Country(
    countryNameES: "Malasia",
    countryNameEN: "Malaysia",
    countryPrefix: "MY",
    countryImage: '',
    ),
    Country(
    countryNameES: "Nigeria",
    countryNameEN: "Nigeria",
    countryPrefix: "NG",
    countryImage: '',
    ),
    Country(
    countryNameES: "Países Bajos",
    countryNameEN: "Netherlands",
    countryPrefix: "NL",
    countryImage: '',
    ),
    Country(
    countryNameES: "Noruega",
    countryNameEN: "Norway",
    countryPrefix: "NO",
    countryImage: '',
    ),
    Country(
    countryNameES: "Nueva Zelanda",
    countryNameEN: "New Zealand",
    countryPrefix: "NZ",
    countryImage: '',
    ),
    Country(
    countryNameES: "Filipinas",
    countryNameEN: "Philippines",
    countryPrefix: "PH",
    countryImage: '',
    ),
    Country(
    countryNameES: "Polonia",
    countryNameEN: "Poland",
    countryPrefix: "PL",
    countryImage: '',
    ),
    Country(
    countryNameES: "Portugal",
    countryNameEN: "Portugal",
    countryPrefix: "PT",
    countryImage: '',
    ),
    Country(
    countryNameES: "Rumania",
    countryNameEN: "Romania",
    countryPrefix: "RO",
    countryImage: '',
    ),
    Country(
    countryNameES: "Serbia",
    countryNameEN: "Serbia",
    countryPrefix: "RS",
    countryImage: '',
    ),
    Country(
    countryNameES: "Rusia",
    countryNameEN: "Russia",
    countryPrefix: "RU",
    countryImage: '',
    ),
    Country(
    countryNameES: "Arabia Saudita",
    countryNameEN: "Saudi Arabia",
    countryPrefix: "SA",
    countryImage: '',
    ),
    Country(
    countryNameES: "Suecia",
    countryNameEN: "Sweden",
    countryPrefix: "SE",
    countryImage: '',
    ),
    Country(
    countryNameES: "Singapur",
    countryNameEN: "Singapore",
    countryPrefix: "SG",
    countryImage: '',
    ),
    Country(
    countryNameES: "Eslovenia",
    countryNameEN: "Slovenia",
    countryPrefix: "SI",
    countryImage: '',
    ),
    Country(
    countryNameES: "Eslovaquia",
    countryNameEN: "Slovakia",
    countryPrefix: "SK",
    countryImage: '',
    ),
    Country(
    countryNameES: "Tailandia",
    countryNameEN: "Thailand",
    countryPrefix: "TH",
    countryImage: '',
    ),
    Country(
    countryNameEN: 'Turkey',
    countryNameES: 'Turquía',
    countryPrefix: 'TR',
    countryImage: '',
    ),
    Country(
    countryNameEN: 'Taiwan',
    countryNameES: 'Taiwán',
    countryPrefix: 'TW',
    countryImage: '',
    ),
    Country(
    countryNameEN: 'Ukraine',
    countryNameES: 'Ucrania',
    countryPrefix: 'UA',
    countryImage: '',
    ),
    Country(
    countryNameEN: 'United States',
    countryNameES: 'Estados Unidos',
    countryPrefix: 'US',
    countryImage: '',
    ),
    Country(
    countryNameEN: 'Venezuela',
    countryNameES: 'Venezuela',
    countryPrefix: 'VE',
    countryImage: '',
    ),
    Country(
    countryNameEN: 'South Africa',
    countryNameES: 'Sudáfrica',
    countryPrefix: 'ZA',
    countryImage: '',
    ),
  ];

  static List<Country> getCountryList(){
    String currentName = "";
    for (var index = 0; index < countries.length; index++) {
      final element = countries[index];
      final name = element.countryNameEN.toLowerCase().split(' ');
      currentName = name.join('-'); 
      element.countryImage = "${CountryBasePath.coutryPath.countryImage}$currentName.png";
    }
    return countries;
  }

  List<Country> get countryList => getCountryList();
} 
