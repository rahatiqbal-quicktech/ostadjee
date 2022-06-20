// ignore_for_file: avoid_print

import 'package:ostadjee/changes/features/tuition_information/service/tuition_information_service.dart';

class TuitionInformationFunctions {
  //

  Future<String?> getDivisionName() async {
    var tempDivisions = await TuitionInformationService().fetchDivisions();
    var tempDetails = await TuitionInformationService().fetchDetails();

    for (var i = 0; i < tempDivisions!.divisiontutors!.length; i++) {
      var division = tempDivisions.divisiontutors![i];
      // print("division = ${division.name}");
      // print("division abc = ${tempDetails?.teacher!.divisionId}");

      if (division.id == tempDetails?.teacher!.divisionId) {
        // print("division.name = ${division.name}");
        return division.name;
      } else {
        return null;
      }
    }
  }

  Future<String?> getAreaName() async {
    var tempAreas = await TuitionInformationService().fetchArea();
    var tempDetails = await TuitionInformationService().fetchDetails();

    for (var i = 0; i < tempAreas!.areas!.length; i++) {
      var area = tempAreas.areas![i];

      if (area.id == tempDetails?.teacher!.districtId) {
        return area.text;
      } else {
        return null;
      }
    }
  }

  Future<String?> getSalary() async {
    var tempSalary = await TuitionInformationService().fetchSalary();
    var tempDetails = await TuitionInformationService().fetchDetails();
    print("tempSalary?.salaries!.length ${tempSalary?.salaries!.length}");
    for (var i = 0; i < tempSalary!.salaries!.length; i++) {
      print("$i : ${tempSalary.salaries![i].id}");
      // var salary = tempSalary.salaries![i];
      // if (salary.id == int.parse("${tempDetails?.teacher!.tuitionSalary}")) {
      //   return salary.salary;
      // } else {
      //   return null;
      // }
    }
  }
}
