//
//  Attributed.swift
//  Attributed
//
//  Created by David House on 1/10/16.
//  Copyright © 2016 David House. All rights reserved.
//

import Foundation

public class Attributed {
    
    let attributes: [String: AnyObject]
    
    // MARK: Initializers
    
    public init() {
        attributes = [String: AnyObject]()
    }
    
    public init(color: AttributedColor) {
        attributes = [AttributedColorAttributeName: color]
    }
    
    public init(font: AttributedFont) {
        attributes = [AttributedFontAttributeName: font]
    }
    
    public init(attributes: [String: AnyObject]) {
        self.attributes = attributes
    }
    
    // MARK: String methods
    
    public func string(inner:() -> String) -> NSAttributedString {
        return NSAttributedString(string: inner(), attributes: attributes)
    }
    
    public func string(inner:() -> NSAttributedString) -> NSAttributedString {
        let output = NSMutableAttributedString(attributedString: inner())
        guard output.length > 0 else {
            return output
        }
        
        var startIndex = 0
        while ( startIndex < output.length ) {
            var range = NSRange()
            let attributesAt = output.attributesAtIndex(startIndex, effectiveRange: &range)
            for attribute in attributes {
                if !attributesAt.keys.contains(attribute.0) {
                    output.addAttribute(attribute.0, value: attribute.1, range: range)
                }
            }
            startIndex = startIndex + range.length
        }
        return output
    }

    public func combine(separator: String = " ", strings: String...) -> NSAttributedString {
        let output = NSMutableAttributedString()
        for inner in strings {
            if output.length > 0 {
                output.appendAttributedString(NSAttributedString(string: separator))
            }
            output.appendAttributedString(string{ inner })
        }
        return output
    }

    public func combine(separator: String = " ", strings: NSAttributedString...) -> NSAttributedString {
        let output = NSMutableAttributedString()
        for inner in strings {
            if output.length > 0 {
                output.appendAttributedString(NSAttributedString(string: separator))
            }
            output.appendAttributedString(string{ inner })
        }
        return output
    }
}

public func + (left:NSAttributedString, right:NSAttributedString) -> NSAttributedString {
    let output = NSMutableAttributedString(attributedString: left)
    output.appendAttributedString(right)
    return output
}

public func + (left:NSAttributedString, right:String) -> NSAttributedString {
    let output = NSMutableAttributedString(attributedString: left)
    output.appendAttributedString(NSAttributedString(string: right))
    return output
}

public func + (left:String, right:NSAttributedString) -> NSAttributedString {
    let output = NSMutableAttributedString(attributedString: NSAttributedString(string: left))
    output.appendAttributedString(right)
    return output
}
