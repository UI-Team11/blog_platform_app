enum AccountType { premium, free }

class UserModel {
  String username, email, id;
  bool isAdmin;
  AccountType accountType;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isAdmin,
    required this.accountType,
  });

  @override
  String toString() {

    return "UserModel:\n"
        "   User ID: $username,\n"
        "   Email: $email,\n"
        "   Account Type: $accountType\n";
  }

}
