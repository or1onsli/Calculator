# Calculator 
![Build](https://img.shields.io/badge/build-passed-brightgreen.svg)
![GitHub license](https://img.shields.io/badge/license-MIT-yellowgreen.svg)
![Platform](https://img.shields.io/badge/platform-iOS-blue.svg)
![Language](https://img.shields.io/badge/language-Swift-orange.svg)
![Device](https://img.shields.io/badge/device-iPhone-lightgrey.svg)

This is my solution to the first programming assignment of the **CS913P** course held by **Paul Hegarty** at the Stanford University and which you can attend via the iTunesU app on your iPad/iPhone.

## The Project
The project is composed by eight required tasks and three optional tasks, I went only through the required ones which are the following:

- Get the Calculator working as demonstrated in lectures 1 and 2 (**for this task watch the first two videos of the course**).

- Your Calculator already works with floating point numbers (e.g. if you touch 3 ÷ 4 =, it will properly show 0.75), however, there is no way for the user to enter a floating point number directly. **Fix this by allowing legal floating point numbers to be entered (e.g. “192.168.0.1” is not a legal floating point number!)**. You will need to have a “.” button in your calculator. Don’t worry too much about precision or significant digits in this assignment (doing so is Extra Credit).

- **Add some more operations buttons to your calculator such that it has at least a dozen operations total** (it can have even more if you like). You can choose whatever operations appeal to you. The buttons must arrange themselves nicely in portrait and landscape modes on all iPhone 6’s and 7’s. (_I only added seven operations_).

- **Use color to make your UI look nice**. At the very least, your operations buttons must be a different color than your keypad buttons, but otherwise you can use color in whatever way you think looks nice.

- **Add a Bool property to your CalculatorBrain called resultIsPending** which returns whether there is a binary operation pending.

- **Add a String property to your CalculatorBrain called description which returns a description of the sequence of operands and operations that led to the value returned by result** (or the result so far if resultIsPending). The character = (the equals sign) should never appear in this description, nor should ... (ellipses).

- **Implement a UILabel in your UI which shows the sequence of operands and operations that led to (or is leading to if resultIsPending) what is (or “will be” if resultIsPending) showing in the display**. If resultIsPending is true, put . . . on the end of the UILabel, else put =. If the userIsInTheMiddleOfTyping, you can leave the UILabel showing whatever was there before the user started typing the number. Examples ...

  -  Touching 7 + would show “7 + ...” (with 7 still in the display)
  
  -  7 + 9 would show “7 + ...” (9 in the display)
  
  -  7 + 9 = would show “7 + 9 =” (16 in the display)
  
  -  7 + 9 = √ would show “√(7 + 9) =” (4 in the display)
  
  -  7 + 9 = √ + 2 = would show “√(7 + 9) + 2 =” (6 in the display)
  
  -  7 + 9 √ would show “7 + √(9) ...” (3 in the display)
  
  -  7 + 9 √ = would show “7 + √(9) =“ (10 in the display)
  
  -  7 + 9 = + 6 = + 3 = would show “7 + 9 + 6 + 3 =” (25 in the display)
  
  -  7 + 9 = √ 6 + 3 = would show “6 + 3 =” (9 in the display)
  
  -  5 + 6 = 7 3 would show “5 + 6 =” (73 in the display)
  
  -  4 × π = would show “4 × π =“ (12.5663706143592 in the display)

- **Add a C button that clears everything** (your display, the new UILabel you added above, any pending binary operations, etc.). Ideally, this should leave your Calculator in the same state it was in when you launched it.

## These are the screenshots of the final result



  <p align="center"> <img src="https://github.com/or1onsli/Calculator/blob/master/iPhone%20X.png" width="400"> <p>
 
 
 
  <p align="center"> <img src="https://github.com/or1onsli/Calculator/blob/master/iPhone%208.png" width="400"> <p>





## 
**Copyright (c) 2017 Andrea Vultaggio under MIT License.**
