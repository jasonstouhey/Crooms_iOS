//
//  Extensions.swift
//  STKit
//
//  Created by Suneet Tipirneni on 10/26/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

// MARK: - Foundation Extenstions

public extension DateFormatter {
    
    /// Formats a date as the time since that date (e.g., “Last week, yesterday, etc.”) CREDIT: Michael Samoylov.
    /// - Parameters:
    ///   - from: The date to process.
    ///   - numericDates: Determines if we should return a numeric variant, e.g. "1 month ago" vs. "Last month".
    /// - Returns: A string with formatted `date`.
    public func timeSince(from: NSDate, numericDates: Bool = false) -> String {
        let calendar = Calendar.current
        let now = NSDate()
        let earliest = now.earlierDate(from as Date)
        let latest = earliest == now as Date ? from : now
        let components = calendar.dateComponents([.year, .weekOfYear, .month, .day, .hour, .minute, .second], from: earliest, to: latest as Date)
        
        var result = ""
        
        if components.year! >= 2 {
            result = "\(components.year!) years ago"
        } else if components.year! >= 1 {
            if numericDates {
                result = "1 year ago"
            } else {
                result = "Last year"
            }
        } else if components.month! >= 2 {
            result = "\(components.month!) months ago"
        } else if components.month! >= 1 {
            if numericDates {
                result = "1 month ago"
            } else {
                result = "Last month"
            }
        } else if components.weekOfYear! >= 2 {
            result = "\(components.weekOfYear!) weeks ago"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                result = "1 week ago"
            } else {
                result = "Last week"
            }
        } else if components.day! >= 2 {
            result = "\(components.day!) days ago"
        } else if components.day! >= 1 {
            if numericDates {
                result = "1 day ago"
            } else {
                result = "Yesterday"
            }
        } else if components.hour! >= 2 {
            result = "\(components.hour!) hours ago"
        } else if components.hour! >= 1 {
            if numericDates {
                result = "1 hour ago"
            } else {
                result = "An hour ago"
            }
        } else if components.minute! >= 2 {
            result = "\(components.minute!) minutes ago"
        } else if components.minute! >= 1 {
            if numericDates {
                result = "1 minute ago"
            } else {
                result = "A minute ago"
            }
        } else if components.second! >= 3 {
            result = "\(components.second!) seconds ago"
        } else {
            result = "Just now"
        }
        
        return result
    }
    
}

public extension Bool{
    /// Changes value to it's opposite value.
    public mutating func toggle(){
        self = !self
    }
}



// MARK: - User Interface Extensions

public extension UIView{
    
    /// Constrains `UIView` to the height and width of another `UIView` with autolayout.
    /// - Important:
    ///Sets the view's [translatesAutoresizingMaskIntoConstraints](https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/Links.html#//apple_ref/doc/uid/TP40016497-CH18-SW1) property to `false`.
    /// - Parameter toView: The view that the parameter view will constrain equal to.
    public func constrainEqual(toView:UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: toView.heightAnchor, multiplier: 1).isActive = true
        self.widthAnchor.constraint(equalTo: toView.widthAnchor, multiplier: 1).isActive = true
        self.centerXAnchor.constraint(equalTo: toView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: toView.centerYAnchor).isActive = true
    }
    
    /// Constrains view to the top of it's superview.
    ///
    /// - Parameters:
    ///   - widthMuliplier: The muliplier against the size of the superview width.
    ///   - heightMultiplier: The multiplier against the size of the superview height.
    /// - Returns: Returns a tuple of (WidthConstraint,HeightConstraint) generated from the function as `NSLayoutConstraint`.
    public func pinToTopOfView(widthMuliplier:CGFloat,heightMultiplier:CGFloat) -> (NSLayoutConstraint,NSLayoutConstraint){
        
        if superview == nil{
            fatalError("The view must be descendant of another view!")
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let appliedHeightAnchor = self.heightAnchor.constraint(equalTo: (superview?.heightAnchor)!, multiplier: heightMultiplier)
        appliedHeightAnchor.isActive = true
        
        let appliedWidthAnchor = self.widthAnchor.constraint(equalTo: (superview?.widthAnchor)!, multiplier: widthMuliplier)
        appliedWidthAnchor.isActive = true
        
        self.topAnchor.constraint(equalTo: (superview?.topAnchor)!, constant: 0).isActive = true
        self.centerXAnchor.constraint(equalTo: (superview?.centerXAnchor)!).isActive = true
        
        
        return (appliedWidthAnchor,appliedHeightAnchor)
        
        
    }
    
    /// Constrains view to the bottom of it's superview.
    ///
    /// - Parameters:
    ///   - widthMuliplier: The muliplier against the size of the superview width.
    ///   - heightMultiplier: The multiplier against the size of the superview height.
    /// - Returns: Returns a tuple of (WidthConstraint,HeightConstraint) generated from the function as `NSLayoutConstraint`.
    public func pinToBottomOfView(widthMuliplier:CGFloat,heightMultiplier:CGFloat) -> (NSLayoutConstraint,NSLayoutConstraint){
        
        if superview == nil{
            fatalError("The view must be descendant of another view!")
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let appliedHeightAnchor = self.heightAnchor.constraint(equalTo: (superview?.heightAnchor)!, multiplier: heightMultiplier)
        appliedHeightAnchor.isActive = true
        
        let appliedWidthAnchor = self.widthAnchor.constraint(equalTo: (superview?.widthAnchor)!, multiplier: widthMuliplier)
        appliedWidthAnchor.isActive = true
        
        self.bottomAnchor.constraint(equalTo: (superview?.topAnchor)!, constant: 0).isActive = true
        self.centerXAnchor.constraint(equalTo: (superview?.centerXAnchor)!).isActive = true
        
        
        return (appliedWidthAnchor,appliedHeightAnchor)
        
        
    }
    
    /// Sets the size constant of the width and height equal to the values of a rect.
    ///
    /// - Parameter rectSize: The size of the width and height constants of a view.
    public func constraintToRect(rectSize:CGSize) -> (heightConstraint:NSLayoutConstraint, widthConstraint:NSLayoutConstraint){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let height = self.heightAnchor.constraint(equalToConstant: rectSize.height)
        height.isActive = true
        let width = self.widthAnchor.constraint(equalToConstant: rectSize.width)
        width.isActive = true
        
        return (height, width)
    }
    
    /// Centers a view within a superview using autolayout.
    public func centerWithinSuperView(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: (superview?.centerXAnchor)!).isActive = true
        self.centerYAnchor.constraint(equalTo: (superview?.centerYAnchor)!).isActive = true
        
    }
    
    
}

public extension UIImage{
    
    /// Gets the average color of an image.
    ///
    /// - Returns: The average color of the image.
    public func areaAverageColor() -> UIColor {
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        
        let context = CIContext(options: nil)
        let cgImg = context.createCGImage(CoreImage.CIImage(cgImage: self.cgImage!), from: CoreImage.CIImage(cgImage: self.cgImage!).extent)
        
        let inputImage = CIImage(cgImage: cgImg!)
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        let filter = CIFilter(name: "CIAreaAverage", withInputParameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent])!
        let outputImage = filter.outputImage!
        let outputExtent = outputImage.extent
        assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)
        
        // Render to bitmap.
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: kCIFormatRGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())
        
        // Compute result.
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        return result
    }
    
    
}

public extension UILabel{
    
    /// Gives the size of the text contained within the label.
    public var rectSizeForText:CGSize{
        get{
            self.adjustsFontSizeToFitWidth = true
            return self.text!.size(withAttributes: [NSAttributedStringKey.font:self.font])
        }
    }
    
    /// Resizes the label to fit the size of it's text.
    public func fitToTextSize(withPadding:CGPoint?){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Reapply contraints.
        let height = CGFloat(numberOfLines) * rectSizeForText.height
        var width = rectSizeForText.width / CGFloat(numberOfLines)
        
        if rectSizeForText.width > superview!.frame.width{
            let newLines:Int = Int((rectSizeForText.width / superview!.frame.width).rounded())
            
            print(rectSizeForText.width / superview!.frame.width)
            print(newLines)
            numberOfLines = newLines
            
            width = rectSizeForText.width / (width / superview!.frame.width)
            print(width)
        }
        
        if withPadding != nil{
            self.heightAnchor.constraint(equalToConstant: height + (withPadding?.y)!).isActive = true
            self.widthAnchor.constraint(equalToConstant: width + (withPadding?.x)!).isActive = true
        }else{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
}





