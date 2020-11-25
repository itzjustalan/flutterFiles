//on successful login
  saveAndExit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = encryptt.Key.fromUtf8('32characters');//todo
    final iv = encryptt.IV.fromLength(16);
    final encrypter = encryptt.Encrypter(encryptt.AES(key));
    final encryptedUserId = encrypter.encrypt(username, iv: iv);
    final encryptedPassword = encrypter.encrypt(password, iv: iv);
    prefs.setString('userId', encryptedUserId.base64);
    prefs.setString('password', encryptedPassword.base64);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }


//authentication override
  authOverride() async {
    print('initiating auth override..');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var encryptedUserId = prefs.getString('userId');
    var encryptedPassword = prefs.getString('password');
    print(encryptedUserId);
    if (encryptedUserId == null) {
      //nav to login
      print('no userId');
      //_navigateToLogin();
      _start().then((status) {
        if (status) {
          _navigateToLogin();
        }
      });
    } else {
      final key = encryptt.Key.fromUtf8('32characters');//todo must be same as above
      final iv = encryptt.IV.fromLength(16);
      final encrypter = encryptt.Encrypter(encryptt.AES(key));
      final userId = encrypter.decrypt64(encryptedUserId, iv: iv);
      final password = encrypter.decrypt64(encryptedPassword, iv: iv);
      //call auth
      var result = await Authentication().login(userId, password);
      //if auth == success
      if (result == 'OK') {
        //nav to home
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        //else to login
        _navigateToLogin();
      }
    }
  }
  
//safely remove the encrypted credentials
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove('userId');
prefs.remove('password');
