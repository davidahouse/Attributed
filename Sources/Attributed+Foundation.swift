//
//  Attributed+Foundation.swift
//  Attributed
//
//  Created by David House on 4/12/16.
//  Copyright © 2016 David House. All rights reserved.
//

import AppKit
import Foundation

// MARK: typealias for AppKit values

public typealias AttributedColor = NSColor
public typealias AttributedFont = NSFont
public let AttributedColorAttributeName: String = NSForegroundColorAttributeName
public let AttributedFontAttributeName: String = NSFontAttributeName

// MARK: NSColor extension

extension NSColor {
    
    /// Create an NSAttributedString from a string while applying a 
    /// NSColor attribute.
    ///
    /// - parameter inner: A String
    /// - returns: An NSAttributedString that has the attributes applied to it
    public func toString(_ inner: String) -> NSAttributedString {
        let attributes = [NSForegroundColorAttributeName: self]
        return NSAttributedString(string: inner, attributes: attributes)
    }    
}

// MARK: NSFont extension

extension NSFont {
    
    /// Create an NSAttributedString from a string while applying a
    /// NSFont attribute.
    ///
    /// - parameter inner: A String
    /// - returns: An NSAttributedString that has the attributes applied to it
    public func toString(_ inner: String) -> NSAttributedString {
        let attributes = [NSFontAttributeName: self]
        return NSAttributedString(string: inner, attributes: attributes)
    }
}
