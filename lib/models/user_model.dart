enum AccountType { premium, free }

class UserModel {
  String username, name;
  AccountType accountType;

  UserModel({
    required this.username,
    required this.name,
    required this.accountType,
  });

  @override
  String toString() {

    return "UserModel:\n"
        "   User ID: $username,\n"
        "   Name: $name,\n"
        "   Account Type: $accountType\n";
  }

}
