import 'package:getx_statemanagment_covidapi/model/model.dart';
import 'package:http/http.dart' as http;

class Getapidata {
  static Future fetchdata() async {
    var parsedata =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));
    if (parsedata.statusCode == 200) {
      var decode = covidFromJson(parsedata.body);
      return decode;
    } else {
      return null;
    }
  }
}
