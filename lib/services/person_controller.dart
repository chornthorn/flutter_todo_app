


class PersonService {

  static final PersonService _instance = PersonService._internal();

  factory PersonService() => _instance;

  PersonService._internal();
  String getPerson() {
    return "Person";
  }


}

class PersonController {

  String getPerson() {
    return PersonService().getPerson();
  }
}

void main() {
  PersonController controller = PersonController();
  final result = controller.getPerson();
  print(result);
}
