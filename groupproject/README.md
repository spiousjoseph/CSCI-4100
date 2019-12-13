# On Tech Carpool

## What is this?

We have made a carpool app that allows users to connect with drivers and carpool together to Ontario Tech University. Simply just sign up and find a driver today. All information sent towards signing up is saved safely on firebase cloud so your information is safe.

## Features

Cloud storage for all of your data, Functional map with geolocation tools added to quickly help find drivers near you, English and French localization support, Easy to read User interface to make life easier, Every tool you will need to help manage your carpool needs. Future updates will include chat functionality, In-App money transfers to send help the driver with gas costs, Camera functionailty for the driver to take a picture of their gas bill, Update notifications to show driver information on tap from the passenger map view, and much more.

## How to use

After compiling and running the application. Sign up at the home screen (or if you want to bypass this and just test the rest username: sunu@gmail.com qqq111)
After successful login select whether you want to setup as a driver or passenger,

If you are a driver,
```
1.Enter your driver information
2.Then sit back and relax as passengers around find you
3.Any requests will appear in the invite screen and you can manage people in your car
```
If you are a passenger,
```
1.Enter your information
2.A map will open up and locate nearby drivers heading in the same direction
3.Tap on one of the drivers and request to join them today.
4.If you are lost on where the map marker is sent no worries just tap on to yourself.
```
## Known Bugs

Data table for passengerlist.dart does not handle selection visuals proper however will still operate the same as if it did. So if user were to tap the check box, the checkbox will not refresh with a checked state however will register to the program that it is selected and have the same functionality as proven when an attempt to delete the passenger is made

Passenger setup does not have error checking on destination. So if an address is inputed that is not an actual address program will result in an error and potentially crash.

PolylineLayer break interaction of markers which leads to breaking snackbars but marker destination still exists


## Contributions

All contributors feel we worked on the program equally and helped each other alot.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
