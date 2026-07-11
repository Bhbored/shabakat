import 'package:shabakat/core/network/dto/request/area/create_area_request.dart';

class DataSeeder {
  DataSeeder._();

  static List<CreateAreaRequest> areas() => _areas;

  static const List<CreateAreaRequest> _areas = [
    CreateAreaRequest(name: 'الميناء'),
    CreateAreaRequest(name: 'باب الرمل'),
    CreateAreaRequest(name: 'باب الحديد'),
    CreateAreaRequest(name: 'باب العين'),
    CreateAreaRequest(name: 'الضاحية'),
    CreateAreaRequest(name: 'المقطم'),
    CreateAreaRequest(name: 'الزاهرية'),
    CreateAreaRequest(name: 'القبة'),
    CreateAreaRequest(name: 'التل'),
    CreateAreaRequest(name: 'أبي سمراء'),
    CreateAreaRequest(name: 'الرفاعية'),
    CreateAreaRequest(name: 'العكار'),
    CreateAreaRequest(name: 'المنكوبين'),
    CreateAreaRequest(name: 'حي الأمراء'),
    CreateAreaRequest(name: 'النصر'),
    CreateAreaRequest(name: 'النجمة'),
    CreateAreaRequest(name: 'القلعة'),
    CreateAreaRequest(name: 'الشهداء'),
    CreateAreaRequest(name: 'الأزهري'),
    CreateAreaRequest(name: 'الخضر'),
    CreateAreaRequest(name: 'البلان'),
    CreateAreaRequest(name: 'الدحداح'),
    CreateAreaRequest(name: 'الصفصاف'),
    CreateAreaRequest(name: 'جبل محسن'),
    CreateAreaRequest(name: 'بعلمهندسين'),
    CreateAreaRequest(name: 'حي السكة'),
    CreateAreaRequest(name: 'حي الصوفي'),
    CreateAreaRequest(name: 'مار مارون'),
    CreateAreaRequest(name: 'طرابلس الجديدة'),
    CreateAreaRequest(name: 'العين'),
  ];
}
