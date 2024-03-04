abstract class CustomerDataSource {

  Future<void> getCustomers();

  Future<void> createCustomer(name, lastName, phone, email, address);

  void setCustomer(id);

  Future<void> editCustomer(name, lastName, phone, email, address);

  Future<void> editStateCustomer(id, state);
}