//
//  Attributed.swift
//  Attributed
//
//  Created by David House on 1/10/16.
//  Copyright © 2016 David House. All rights reserved.
//

import Foundation

/// A helper class for creating NSAttributedString objects
open class Attributed {
    
    let attributes: [String: AnyObject]
    
    // MARK: Initializers
    
    /// Initialize with an empty set of attributes
    public init() {
        attributes = [String: AnyObject]()
    }
    
    /// Initialize with only a foreground color attribute
    ///
    /// - parameter color: The foreground color attribute
    public init(color: AttributedColor) {
        attributes = [AttributedColorAttributeName: color]
    }
    
    /// Initialize with only a font attribute
    /// 
    /// - parameter font: The font attribute
    public init(font: AttributedFont) {
        attributes = [AttributedFontAttributeName: font]
    }
    
    /// Initialize with a dictionary of attributes
    ///
    /// - parameter attributes: A dictionary of attributed string attributes
    public init(attributes: [String: AnyObject]) {
        self.attributes = attributes
    }
    
    // MARK: String methods

    /// Create an NSAttributedString from a String,
    /// while applying attributes.
    ///
    /// - parameter inner: A String
    /// - returns: An NSAttributedString that has the attributes applied to it
    open func toString(_ inner: String) -> NSAttributedString {
        return NSAttributedString(string: inner, attributes: attributes)
    }
    
    /// Create an NSAttributedString from a closure that returns a String,
    /// while applying attributes.
    ///
    /// - parameter inner: A closure that returns a String
    /// - returns: An NSAttributedString that has the attributes applied to it
    open func toString(_ inner:() -> String) -> NSAttributedString {
        return NSAttributedString(string: inner(), attributes: attributes)
    }
    
    /// Create an NSAttributedString from an NSAttributedString, while also applying our attributes
    ///
    /// This method will not overwrite any attribute that has already been
    /// applied to the string.
    ///
    /// - parameter inner: An NSAttributedString
    /// - returns: An NSAttributedString that has the attributes applied to it
    open func toString(_ inner: NSAttributedString) -> NSAttributedString {
        let output = NSMutableAttributedString(attributedString: inner)
        guard output.length > 0 else {
            return output
        }
        
        var startIndex = 0
        while ( startIndex < output.length ) {
            var range = NSRange()
            let attributesAt = output.attributes(at: startIndex, effectiveRange: &range)
            for attribute in attributes {
                if !attributesAt.keys.contains(attribute.0) {
                    output.addAttribute(attribute.0, value: attribute.1, range: range)
                }
            }
            startIndex = startIndex + range.length
        }
        return output
    }
    
    /// Create an NSAttributedString from a closure that returns an NSAttributedString, while also applying our attributes
    ///
    /// This method will not overwrite any attribute that has already been
    /// applied to the string.
    ///
    /// - parameter inner: A closure that returns an NSAttributedString
    /// - returns: An NSAttributedString that has the attributes applied to it
    open func toString(_ inner:() -> NSAttributedString) -> NSAttributedString {
        
        return toString(inner())
    }

    /// Create an NSAttributedString by combining multiple Strings using 
    /// a separator, while also applying our attributes.
    ///
    /// - parameter separator: The separator to use between each String, with space being the default
    /// - parameter strings: A variable number of String objects that will be combined
    /// - returns: An NSAttributedString with all the Strings combined and attributes applied
    open func combine(_ separator: String = " ", strings: String...) -> NSAttributedString {
        let output = NSMutableAttributedString()
        for inner in strings {
            if output.length > 0 {
                output.append(NSAttributedString(string: separator))
            }
            output.append(toString{ inner })
        }
        return output
    }

    /// Create an NSAttributedString by combining multiple NSAttributedStrings using
    /// a separator, while also applying our attributes.
    ///
    /// - parameter separator: The separator to use between each String, with space being the default
    /// - parameter strings: A variable number of NSAttributedString objects that will be combined
    /// - returns: An NSAttributedString with all the NSAttributedStrings combined and attributes applied
    open func combine(_ separator: String = " ", strings: NSAttributedString...) -> NSAttributedString {
        let output = NSMutableAttributedString()
        for inner in strings {
            if output.length > 0 {
                output.append(NSAttributedString(string: separator))
            }
            output.append(toString{ inner })
        }
        return output
    }
}

/// Add two NSAttributedStrings together
///
/// - parameter left: An NSAttributedString
/// - parameter right: Another NSAttributedString
/// - returns: An NSAttributedString representing left + right
public func + (left:NSAttributedString, right:NSAttributedString) -> NSAttributedString {
    let output = NSMutableAttributedString(attributedString: left)
    output.append(right)
    return output
}

/// Add an NSAttributedString and String together
///
/// - parameter left: An NSAttributedString
/// - parameter right: A String
/// - returns: An NSAttributedString representing left + right
public func + (left:NSAttributedString, right:String) -> NSAttributedString {
    let output = NSMutableAttributedString(attributedString: left)
    output.append(NSAttributedString(string: right))
    return output
}

/// Add a String and NSAttributedString together
///
/// - parameter left: A String
/// - parameter right: An NSAttributedString
/// - returns: An NSAttributedString representing left + right
public func + (left:String, right:NSAttributedString) -> NSAttributedString {
    let output = NSMutableAttributedString(attributedString: NSAttributedString(string: left))
    output.append(right)
    return output
}
