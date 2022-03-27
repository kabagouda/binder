# **Binder Framework**

[**Binder**](https://binder.kabagouda.com) is a web framework that can be used to create web apps and APIs .

<p align="center" >
  <img  width ="600" src="https://user-images.githubusercontent.com/64534846/158489733-67af3a32-5584-44c6-9ffe-043cb1c5ca8f.png" alt="Binder logo">
</p>

## **Get started** 

<!-- ![binger logo](https://user-images.githubusercontent.com/64534846/158489733-67af3a32-5584-44c6-9ffe-043cb1c5ca8f.png) -->

  First of all, we need to download Binder SDK framework.
  If you are using windows , download it directly [here](https://github.com/kabagouda/binder/releases/download/binder-sdk-windows/binder-sdk.rar) . 
  Add it (path to `binder-sdk/bin` ) in your **Environment variable path** .If everything is ok , if you type `binder` in your CMD it will work fine , so enjoy it .

### **Download Binder SDK :**

  -[Windows](https://github.com/kabagouda/binder/releases/download/binder-sdk-windows/binder-sdk.rar)

  -MacOS (soon)

  -Linux (soon)

**Alternative (sdk/binder-bin) for others plaforms  (linux and macOS users):**,  

You can use it by doing this:

Download [Dart SDK from dart official website](https://dart.dev/get-dart/archive#stable-channel) for your plaform and add binder-bin from binder github folder in the Dart SDK . Then, active it by doing  `dart pub global activate --source path binder-bin` in the root.
It works on all platforms .

### **Note :**

If you already have an old dart sdk in your environment variable, please remove it before adding the binder one otherwise there will be a conflict. The SDK of binder already contains the SDK of Dart. 

After the installation , you can use it  

To create a new project , use :

 `binder create <project_name>`

To run the project , use :

`binder run`

**An example of project** :

```dart
import 'package:binder/bootstrap.dart';

void main() {
  runApp(MyApp());
 
}

class MyApp extends Widget {
  @override
  Element toElement() {
    return BootstrapContainer(
      child: BootstrapCenter(
        child: BootstrapText('Hello World'),
      ),
    ).toElement();
  }
}
```

## **For flutter developers**

### **Frontend** :

If you have already used flutter, you know that flutter uses mainly two designs, the **Material Design** (eg: `Center`, `TextStyle`, `Color`, `Icon`) and the **Cupertino** (eg: `CupertinoTextStyle`, `CupertinoIcons` etc ...).

- For the flutter material (the most used) we import first
`package:flutter/material.dart` and there we can use widgets like , `AlertDialog` , `AppBar` , `Center` , `Color` , `TextStyle`, `DatePicker` etc ...

- For the flutter cupertino (less used) we import first
`package:flutter/cupertino.dart` and there we can use widgets like `CupertinoAlertDialog` , `CupertinoButton` ,`CupertinoApp` , `CupertinoColors` , `CupertinoTextStyle`, `CupertinoDatePicker` etc ...

It is on this principle that the framework binder was created.
With binder you have access to more than 4 approaches:
**Material** , **Materialize** , **Bootstrap** , **MBootstrap** (MaterialBootstrap) .

- For the **Binder Material** we will import first
`package:binder/material.dart` and there we can use widgets like , `Text` , `Center` , `Color` , `TextStyle`, ...

- For the **Binder Bootsrap** we will import first
`package:binder/bootsrap.dart` and there we can use widgets like , `BootsrapText` ,`BootsrapCenter` , `BootsrapColor` , `BootsrapTextStyle`, etc ...

Same for **Materialize** and **MBootstrap** but not stable.

### **Message from the author :**

Currently only **Binder bootstrap** is not very advanced, so for beta testers, I suggest it for now even if materialize also not bad. Bootstrap will be complete in the next few weeks. Thanks

### **Binder and the fullstack approach :**

Binder allows you to manage not only the frontend but also the backend of your site.

- To write front end, it's in `lib/main.dart` .
- To write backend , it's in `bin/server.dart` .

For this release, it is not yet possible to create api and manage routing with your server but it will be possible in the next release.

### **A complete documentation will be published soon**

You can use widgets like `WebApp` (similar to MaterialApp or CupertinoApp) , `Divider` , `BoostrapColumn` , `BoostrapRow` , `BoostrapImage` , `BoostrapCenter` , `Center` , `Text` , `BoostrapText`, etc ...

100+ widgets are added or are being added actually .

In the documentaion you will see how to deploy your website , how to manipulate the routes , how to add your own html , css or javascript code , how to add firebase , mongodb or any other database .

If you want to contribute, soon it will be possible from the alpha version and once the official documentation is available.

**Thank you for your future contribution.**
