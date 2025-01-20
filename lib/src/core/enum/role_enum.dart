enum Role {
  coordinator('coordinator'),
  volunteer('volunteer'),
  admin('');

  const Role(this.value);

  final String value;

  factory Role.fromString(String? value) {
    if (value == null || value == '') return Role.admin;
    return Role.values.firstWhere(
      (role) => role.value == value,
      orElse: () => Role.admin,
    );
  }
}
