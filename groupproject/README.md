# On Tech Carpool

## What is this?

We have made a carpool app that allows users to connect with drivers and carpool together to Ontario Tech University. Simply just sign up and find a driver today. All information sent towards signing up is saved safely on firebase cloud so your information is safe.

## Features

Cloud storage for all of your data INCLUDING authentication. Functional map with geolocation tools added to quickly help find drivers near you. Some English and French localization support, easy to read user interface to make life easier.

## How to use

After compiling and running the application. Sign up at the home screen. If you type in something like kjahsdkjhas for email, it will throw an error msg. Must use a proper email text like Randy@gmail.com etc. Password Must be 6 or more characters long. (or if you want to bypass this and just test the rest, use username: a@gmail.com qqq111). Using Sign Up and creating an account is recommended. 

User will remaine logged in even after shutting down app, until they press logout.

After successful login, select whether you want to setup as a driver or passenger.

If you are a driver,
```
1.Under Driver, you can create a trip here to be posted. (can also update it here).
2.Then sit back and relax as passengers find you.
3.View your posted trip under "My Driving Trip".
```
To take a trip as a passenger,
```
1.The trip info for all drivers is listed out under show all drivers.
2.The driver's phone number is displayed for you to call if you are interested in carpooling with that driver.
```
The plus button,
```
1.This is where users can keep any personal notes they want to jot down.
2.This is stored locally. The function to store that info is working properly (as shown in the console log).
3.The function to retrieve notes is implemented, but due to a brain fart I could not find a way to display it on screen in time.
```
Features Coming Soon in the next patch: 
```
1.Under the passenger tab, you can view all the posted trips and their info.
2.A map will open up and locate nearby drivers heading in the same direction.
3.Tap on one of the drivers and request to join them.
4.If you are lost on where the map marker is sent no worries just tap on to yourself.
5.The silly billy programmers forgot to add a delete function for the driver to delete their trip in time, though this implementation is super easy so it will come next patch, just call delete() to the Drivers database that has a UID matching the current user's UID.
```
## Known Bugs

Data table for passengerlist.dart does not handle selection visuals properly, however will still operate the same as if it did. So if user were to tap the check box, the checkbox will not refresh with a checked state however will register to the program that it is selected and have the same functionality as proven when an attempt to delete the passenger is made.

Passenger setup does have a small error checking on destination. If an address is inputed that is not an actual address, the program will result in an error and potentially crash.

PolylineLayer break interaction of markers which leads to breaking snackbars but marker destination still exists.

## Additional Notes. 
Our Database may expire since it's in test mode and don't know whether not it will expire before the 17th. Please contact us if there is a cloudbase issue.

## Contributions

All contributors feel we worked on the program equally and helped each other alot.
