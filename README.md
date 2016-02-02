# EUActivityView

[![CI Status](http://img.shields.io/travis/eduardourso/EUActivityView.svg?style=flat)](https://travis-ci.org/eduardourso/EUActivityView)
[![Version](https://img.shields.io/cocoapods/v/EUActivityView.svg?style=flat)](http://cocoapods.org/pods/EUActivityView)
[![License](https://img.shields.io/cocoapods/l/EUActivityView.svg?style=flat)](http://cocoapods.org/pods/EUActivityView)
[![Platform](https://img.shields.io/cocoapods/p/EUActivityView.svg?style=flat)](http://cocoapods.org/pods/EUActivityView)

## Demo

![alt tag](https://raw.github.com/eduardourso/EUActivityView/master/Example/animation.gif)
![alt tag](https://raw.github.com/eduardourso/EUActivityView/master/Example/animation2.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### Avaliable in CocoaPods
EUActivityView is available through [CocoaPods](https://cocoapods.org) See the "[Getting Started](http://guides.cocoapods.org/syntax/podfile.html)" guide for more information.

To install it, simply add the following line to your Podfile:

#### Podfile
```ruby
platform :ios, '8.0'
pod "EUActivityView"
```
Then, run the following command

```ruby
pod install
```

### Practical use

```swift
var activityView = EUActivityView(frame: CGRectMake(0,0,100,100))
self.activityView.showCustomActivityView(self.view, type: .Pulse)
```
Then whenever you need to hide it just call the 'hideLoadingView' method

```swift
self.activityView.hideLoadingView()
```

### Customizable
The EUALoadingView is completely customizable, follow bellow the properties that are avaliable for custom implementation.

```
type: EUActivityIndicatorStyle - there are 2 diferent types avaliable right now: .Pulse and .SoundScale
customBackgroundColor - setting up this property will override the background color of the squared view. 
customActivityIndicatorColor  -  setting up this property it will override the activity indicator color.
```

### Example Project
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Eduardo Urso, eduardourso@gmail.com

## License

EUActivityView is available under the MIT license. See the LICENSE file for more info.
