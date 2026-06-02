enum CustomerRelation { friend, family, owner }

extension CustomerRelationX on CustomerRelation {
  String get label => switch (this) {
    CustomerRelation.friend => 'Friend',
    CustomerRelation.family => 'Family',
    CustomerRelation.owner => 'Owner',
  };
}
