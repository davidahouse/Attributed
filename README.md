# Attributed

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/DAHAttributed.svg)](https://cocoapods.org/pods/DAHAttributed)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](./LICENSE.txt)
[![Build Status](https://travis-ci.org/davidahouse/Attributed.svg)](https://travis-ci.org/davidahouse/DAHAttributed)

Creating NSAttributedString objects can be cumbersome to do in code. This library adds a helper object that can apply attributes to strings easily.

## Installation

### [Carthage]

[Carthage]: https://github.com/Carthage/Carthage

Add the following to your Cartfile:

```ruby
github "davidahouse/Attributed" "master"
```

Then run `carthage update`.

Follow the current instructions in [Carthage's README][carthage-installation]
for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage/blob/master/README.md

### [CocoaPods]

[CocoaPods]: http://cocoapods.org

Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```ruby
pod 'DAHAttributed'
```

You will also need to make sure you're opting into using frameworks:

```ruby
use_frameworks!
```

Then run `pod install`.

## Overview

Creating a NSAttributedString with different formats applied to different sections of the string involves
a lot of code. If you have some basic formatting needs, and some strings, this library allows for creating
an NSAttributedString quickly.

The helper class is called `Attributed` contains a set of formatting attributes, then gives a simple set
of methods for applying those attributes to strings or NSAttributedStrings. It also provides a way for
strings and NSAttributedStrings to be added together.

### Creating an `Attributed` object

- No formatting at all

```swift
let noFormatting = Attributed()
```

- Apply a color

```swift
let redText = Attributed(color: NSColor.redColor())
let blueText = Attributed(color: NSColor.blueColor())
```

- Apply a font

```swift
let boldText = Attributed(font: NSFont.boldSystemFontOfSize(24))
```

- Multiple values

```swift
let detailsText = Attributed(attributes: [NSForegroundColorAttributeName: NSColor.greenColor(), NSFontAttributeName: NSFont.systemFontOfSize(18)])
```

### Using an `Attributed` object

- Apply the formatting to a String

```swift
let stringWithAttributes = redText.string { "Hi mom!" }
```

- Apply the formatting to a NSAttributedString

```swift
let attributedStringWithAttributes = redText.string { NSAttributedString(string: "The quick brown fox") }
```

- Combining Strings

```swift
let multipleStrings = boldText.combine(strings: "Hi mom!", "The quick brown fox")
```

- Nesting

```swift
let nestedStrings = redText.string { boldText.string { "Header: " } + "here are the details" }
```

- More nesting

```swift
let anotherNestedString = redText.string { boldText.string { "Header: " } + detailsText.string { "here are the details" } + blueText.string{ "@" } }
```

- Strings and attributed strings can be added together

```swift
let addedString = stringWithAttributes + " How are you?"
```
