class Validation {

  static String? validateMobile(String? value) {
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digits';
    }else{
      return null;
    }
  }

  static String? validateAddress(String? value) {
    if (value!.trim().isEmpty || value.trim().length < 20) {
      return 'Enter a valid address';
    }else{
      return null;
    }
  }

  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if(value!.isEmpty){
      return 'Email cant be empty';
    }else if(!regex.hasMatch(value)){
      return 'Enter a valid email';
    }else{
      return null;
    }
  }

  static String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Password cant be empty';
    }
    else if(value.length<8){
      return 'Password length should be min 8';
    }
    else if (!regex.hasMatch(value)) {
      return 'Password should be eg : Letslearn@2024';
    }
    else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value!.trim().isEmpty) {
      return 'Confirm Password cannot be empty';
    } else if (value != password) {
      return 'Passwords does not match';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter your full name';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid full name';
    }else if (value.trim().length < 4) {
      return 'Name must be at least four characters long';
    }
    return null;
  }

}