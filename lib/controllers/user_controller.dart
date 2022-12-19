import 'package:exam_practic_getx/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Declaram la classe que hereda de ChangeNotifies
class UserController extends GetxController {
  UserResponse? userResponse; // Objecte UserResponse

  var isDataLoading = false.obs;

  // Vairables d'accés a la API
  String _baseUrl = 'reqres.in';
  int page = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getData() async {
    try {
      isDataLoading(true);
      // Variable url on fer la petició
      // usam variable per fer el codi més net.
      var url = Uri.https(_baseUrl, 'api/users', {
        'page': page.toString(),
      });

      //Recuperar dades a traves del http
      final result = await http.get(url);

      if (result.statusCode == 200) {
        // Dades Correctes

        //Emplenar object3e
        userResponse = UserResponse.fromJson(result.body);
      } else {
        ///error
        print("error");
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
