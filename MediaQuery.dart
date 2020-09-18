flutter MediaQuery


MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight - kBottomNavigationBarHeight






We will be using MediaQuery.of(context).size to retrieve the device screen size. Before jumping to some simple code examples we need to understand what the size means in this context. It is not the actual physical resolution in pixels but rather it expresses logical pixels. But that’s exactly what we need. MediaQuery uses a devicePixelRatio property. Basically, if you want to tell the exact physical pixel value of your screen width you will need to do something like this: MediaQuery.of(context).size.width *


MediaQuery.of(context).devicePixelRatio . In reality we don’t need to do such calculations in most of the cases as the size properties of Flutter widgets use the logical pixels.
Now, all you need to know really is that you can retrieve the width of the screen with MediaQuery.of(context).size.width and the height of the screen with MediaQuery.of(context).size.height. If you want to get a Size object with both dimensions you can get with with just MediaQuery.of(context).size.
Very important is to use import ‘package:flutter/material.dart’; to be able to use MediaQuery, too.
Retrieving the meaningful height can be tricky
To avoid another head bang onto the wall there is a bit of a trick for the height value that we need to know. The height includes the AppBar and status bar heights, too. Should you look to deduct those from the total height you can retrieve their values. The constant kToolbarHeight has the height value of the AppBar (if you are using the default AppBar height) and with MediaQuery.of(context).padding.top you can retrieve the height of the status bar. Then the actual meaningful screen height will be: MediaQuery.of(context).size.height — MediaQuery.of(context).padding.top — kToolbarHeight . Furthermore, if you use a BottomNavigation bar, the default height is stored in kBottomNavigationBarHeight constant. Naturally, in that case, the screen height will be: MediaQuery.of(context).size.height — MediaQuery.of(context).padding.top — kToolbarHeight — kBottomNavigationBarHeight . Really, all depends on your use case.
