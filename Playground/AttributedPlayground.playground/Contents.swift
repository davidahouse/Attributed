//: Playground - noun: a place where people can play

import AppKit
import Foundation
import Attributed

//: All the ways you can create an Attributed:

//: No formatting at all
let noFormatting = Attributed()

//: Apply a color
let redText = Attributed(color: NSColor.redColor())
let blueText = Attributed(color: NSColor.blueColor())

//: Apply a font
let boldText = Attributed(font: NSFont.boldSystemFontOfSize(24))

//: Multiple values
let detailsText = Attributed(attributes: [NSForegroundColorAttributeName: NSColor.greenColor(), NSFontAttributeName: NSFont.systemFontOfSize(18)])

//: Usage once you have an Attributed:

//: Apply the formatting to a String
let stringWithAttributes = redText.string { "Hi mom!" }
stringWithAttributes

//: Apply the formatting to a NSAttributedString
let attributedStringWithAttributes = redText.string { NSAttributedString(string: "The quick brown fox") }
attributedStringWithAttributes

//: Combining Strings
let multipleStrings = boldText.combine(strings: "Hi mom!", "The quick brown fox")
multipleStrings

//: Nesting
let nestedStrings = redText.string { boldText.string { "Header: " } + "here are the details" }
nestedStrings

//: More nesting
let anotherNestedString = redText.string { boldText.string { "Header: " } + detailsText.string { "here are the details" } + blueText.string{ "@" } }
anotherNestedString

//: Strings and attributed strings can be added together
let addedString = stringWithAttributes + " How are you?"
addedString
