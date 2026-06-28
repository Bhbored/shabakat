import 'package:easy_localization/easy_localization.dart';

enum CustomerRelation { friend, family, owner }

extension CustomerRelationX on CustomerRelation {
  String get label => switch (this) {
    CustomerRelation.friend => 'subscribers.relation.friend'.tr(),
    CustomerRelation.family => 'subscribers.relation.family'.tr(),
    CustomerRelation.owner => 'subscribers.relation.owner'.tr(),
  };
}
