//
//  Attributed+UIKit.swift
//  Attributed
//
//  Created by David House on 4/12/16.
//  Copyright © 2016 David House. All rights reserved.
//

import UIKit

// MARK: typealias for UIKit values

public typealias AttributedColor = UIColor
public typealias AttributedFont = UIFont
public let AttributedColorAttributeName: String = NSForegroundColorAttributeName
public let AttributedFontAttributeName: String = NSFontAttributeName

// MARK: UIColor extension

extension UIColor {
    
    /// Create an NSAttributedString from a string while applying a
    /// UIColor attribute.
    ///
    /// - parameter inner: A String
    /// - returns: An NSAttributedString that has the attributes applied to it
    public func toString(innerString: String) -> NSAttributedString {
        let attributes = [NSForegroundColorAttributeName: self]
        return NSAttributedString(string: innerString, attributes: attributes)
    }
}

// MARK: NSFont extension

extension UIFont {
    
    /// Create an NSAttributedString from a string while applying a
    /// UIFont attribute.
    ///
    /// - parameter inner: A String
    /// - returns: An NSAttributedString that has the attributes applied to it
    public func toString(inner: String) -> NSAttributedString {
        let attributes = [NSFontAttributeName: self]
        return NSAttributedString(string: inner, attributes: attributes)
    }
}
