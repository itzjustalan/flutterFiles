Flutter navigation


onPressed: () {
  navigateToSubPage(context);
},


Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}


// to go back


Navigator.pop(context);


//this is because flutter screens are arranged as a stack and every time you to a new page it gets added to the top of the stack and when you go back it is poped out and the user always sees the top screen in the stack
// refrence image ->




flutter platform switch


    backgroundColor:
        Theme.of(context).platform == TargetPlatform.iOS
            ? Colors.blue
            : Colors.white,
