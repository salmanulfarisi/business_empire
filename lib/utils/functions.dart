class AppFunctions {
  static String getFormattedDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static greetings(String greeting) {
    if (DateTime.now().hour < 12) {
      greeting = 'Good Morning';
    } else if (DateTime.now().hour < 17) {
      greeting = 'Good Afternoon';
    } else if (DateTime.now().hour < 20) {
      greeting = 'Good Evening';
    } else if (DateTime.now().hour < 24) {
      greeting = 'Good Night';
    }
    return greeting;
  }

  // int _counter = 0;

  // _incrementCounter() {
  //   setState(() {
  //     for (var i = 0; i < 100; i++) {
  //       //Loop 100 times
  //       Future.delayed(const Duration(milliseconds: 500), () {
  //         // Delay 500 miliseconds
  //         _counter++; //Increment Counter
  //       });
  //     }
  //   });
  // }
}
