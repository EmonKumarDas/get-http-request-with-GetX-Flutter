import 'package:get/state_manager.dart';
import 'package:getx_statemanagment_covidapi/fetchapi/fetchapi.dart';
import 'package:getx_statemanagment_covidapi/model/model.dart';

class CovidProvider extends GetxController {
  var datalist = List<Covid>().obs;
  @override
  void onInit() {
    super.onInit();
    fetchcovidproduct();
  }

  void fetchcovidproduct() async {
    var covidata = await Getapidata.fetchdata();
    datalist.value = covidata;
  }
}
