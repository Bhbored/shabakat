import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_response.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

extension CustomerResponseMapper on CustomerResponse {
  Customer toEntity() => Customer(
        id: id,
        createdAt: createdAt,
        updatedAt: createdAt,
        companyId: '',
        name: name,
        phone: phone,
        address: address,
        customerType: CustomerType.values.firstWhere(
          (e) => e.name.toLowerCase() == customerType.toLowerCase(),
          orElse: () => CustomerType.residential,
        ),
        customerRelation: customerRelation != null
            ? CustomerRelation.values.firstWhere(
                (e) => e.name.toLowerCase() == customerRelation!.toLowerCase(),
                orElse: () => CustomerRelation.friend,
              )
            : null,
        subscriptionDate: subscriptionDate,
        priceOverride: pricingOverride?.price,
        fixedChargeOverride: pricingOverride?.fixedCharge,
        tvaOverride: pricingOverride?.tva,
        customerStatus: CustomerStatus.values.firstWhere(
          (e) => e.name.toLowerCase() == customerStatus.toLowerCase(),
          orElse: () => CustomerStatus.active,
        ),
        plan: PlanType.values.firstWhere(
          (e) => e.name.toLowerCase() == plan.toLowerCase(),
          orElse: () => PlanType.ampere,
        ),
        planValue: planValue,
      );
}
