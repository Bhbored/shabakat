import 'package:shabakat/core/network/dto/request/area/create_area_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/create_distribution_box_request.dart';

class DataSeeder {
  DataSeeder._();

  static List<CreateAreaRequest> areas() => _areas;

  static List<CreateDistributionBoxRequest> distributionBoxes() =>
      _distributionBoxes;

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

  static const List<CreateDistributionBoxRequest> _distributionBoxes = [
    CreateDistributionBoxRequest(
      name: 'صندوق الميناء الرئيسي',
      areaId: '019f50b5-c56e-771b-94e0-482870183e68',
      locationNote: 'عند ساحة الميناء - قرب المرفأ',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة باب الرمل - فيصل',
      areaId: '019f50b5-c674-7456-a756-8ee5b321134d',
      locationNote: 'شارع الأمير فيصل - وسط الحي',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق باب الحديد',
      areaId: '019f50b5-c74f-7865-9e6a-81c86ed7add2',
      locationNote: 'قرب سوق باب الحديد',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة باب العين',
      areaId: '019f50b5-c83f-76bf-a499-7d30a9df7281',
      locationNote: 'مدخل باب العين - عند المدارس',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق الضاحية',
      areaId: '019f50b5-c8d0-75e2-9cb3-a53f61ee0e45',
      locationNote: 'شارع عثمان بن عفان',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة المقطم',
      areaId: '019f50b5-c996-768e-93ba-0a80ffb4fb1c',
      locationNote: 'مدخل حي المقطم',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق الزاهرية',
      areaId: '019f50b5-ca30-73b1-8ccf-34e6a09d57eb',
      locationNote: 'وسط الزاهرية - قرب الدكانة',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة القبة',
      areaId: '019f50b5-cad1-7ec6-8320-261ef19b7b4f',
      locationNote: 'قرب مسجد القبة',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق التل',
      areaId: '019f50b5-cb9c-71eb-9da8-d0afc797edff',
      locationNote: 'أعلى التل - نهاية الشارع',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة أبي سمراء',
      areaId: '019f50b5-cc8d-7c08-87d3-10060aa134f1',
      locationNote: 'الشارع الرئيسي - أبي سمراء',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق الرفاعية',
      areaId: '019f50b5-cd41-7028-b3e8-f08c4f036cef',
      locationNote: 'قرب دوار الرفاعية',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة العكار',
      areaId: '019f50b5-cdd4-7c2d-95bc-60ec105f3b20',
      locationNote: 'مدخل منطقة العكار',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق المنكوبين',
      areaId: '019f50b5-ce55-7bda-a1b3-77a345709c02',
      locationNote: 'وسط المنكوبين - عند المحلات',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة حي الأمراء',
      areaId: '019f50b5-cf2f-7fd3-a0ed-b58eb0cf5869',
      locationNote: 'عند ساحة حي الأمراء',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق النصر',
      areaId: '019f50b5-d03f-72fc-8ec3-1ffe050a3379',
      locationNote: 'شارع النصر - مدخل الحي',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة النجمة',
      areaId: '019f50b5-d0d9-7ae7-81ad-6559a1137b7c',
      locationNote: 'قرب سوق النجمة',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق القلعة',
      areaId: '019f50b5-d1c8-7a0d-aa31-9a88839fc069',
      locationNote: 'تحت القلعة - الطريق الفرعي',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة الشهداء',
      areaId: '019f50b5-d277-7b46-9c53-51b7c331449f',
      locationNote: 'مدخل حي الشهداء',
    ),
    CreateDistributionBoxRequest(
      name: 'صندوق جبل محسن',
      areaId: '019f50b5-d5d8-77e7-b01e-cee1e9afdcea',
      locationNote: 'شارع الجبل - وسط جبل محسن',
    ),
    CreateDistributionBoxRequest(
      name: 'علبة طرابلس الجديدة',
      areaId: '019f50b5-d913-79d3-ad1e-6d92066cb353',
      locationNote: 'قرب البنوك - طرابلس الجديدة',
    ),
  ];
}
