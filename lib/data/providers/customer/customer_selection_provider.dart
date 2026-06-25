import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_selection_provider.g.dart';

Duration? retry(int _, Object _) => null;

class CustomerSelection {
  final bool isSelectionMode;
  final List<String> selectedCustomerIds;

  const CustomerSelection({
    this.isSelectionMode = false,
    this.selectedCustomerIds = const [],
  });

  CustomerSelection copyWith({
    bool? isSelectionMode,
    List<String>? selectedCustomerIds,
  }) {
    return CustomerSelection(
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedCustomerIds: selectedCustomerIds ?? this.selectedCustomerIds,
    );
  }
}

@Riverpod(keepAlive: true, retry: retry)
class CustomerSelectionNotifier extends _$CustomerSelectionNotifier {
  @override
  CustomerSelection build() => const CustomerSelection();

  void update(CustomerSelection next) => state = next;

  void clear() => state = const CustomerSelection();
}
