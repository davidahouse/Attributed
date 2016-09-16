//: Playground - noun: a place where people can play

import AppKit
import Foundation
import Attributed

//: All the ways you can create an Attributed:

//: No formatting at all
let noFormatting = Attributed()

//: Apply a color
let redText = Attributed(color: NSColor.red)
let blueText = Attributed(color: NSColor.blue)

//: Apply a font
let boldText = Attributed(font: NSFont.boldSystemFont(ofSize: 24))

//: Multiple values
let detailsText = Attributed(attributes: [NSForegroundColorAttributeName: NSColor.green, NSFontAttributeName: NSFont.systemFont(ofSize: 18)])

//: Usage once you have an Attributed:

//: Apply the formatting to a String
let stringWithAttributes = redText.toString { "Hi mom!" }
stringWithAttributes

//: Apply the formatting to a NSAttributedString
let attributedStringWithAttributes = redText.toString { NSAttributedString(string: "The quick brown fox") }
attributedStringWithAttributes

//: Combining Strings
let multipleStrings = boldText.combine(strings: "Hi mom!", "The quick brown fox")
multipleStrings

//: Nesting
let nestedStrings = redText.toString { boldText.toString { "Header: " } + "here are the details" }
nestedStrings

//: More nesting
let anotherNestedString = redText.toString { boldText.toString { "Header: " } + detailsText.toString { "here are the details" } + blueText.toString{ "@" } }
anotherNestedString

//: Strings and attributed strings can be added together
let addedString = stringWithAttributes + " How are you?"
addedString
