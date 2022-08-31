//
//  UIColor+.swift
//  elementsTest
//
//  Created by Yaroslav Krasnokutskiy on 16.8.22..
//

import UIKit

extension UIColor {
    public static let revelBlue = UIColor(red: 0, green: 161, blue: 224)
    public static let revelBlueLt = UIColor(red: 236, green: 242, blue: 248)
    public static let revelNight = UIColor(red: 55, green: 59, blue: 64)
    public static let revelRed = UIColor(red: 243, green: 57, blue: 42)
    public static let revelGreen = UIColor(red: 63, green: 196, blue: 165)
    public static let revelBackgroundGray = UIColor(red: 239, green: 239, blue: 244)
    public static let revelBackgroundLight = UIColor(red: 251, green: 251, blue: 251)
    public static let revelGray = UIColor(red: 215, green: 215, blue: 215)
    public static let revelDarkGray = UIColor(red: 142, green: 142, blue: 147)
    public static let astronautBlue = UIColor(red: 5, green: 59, blue: 102)
    public static let revelYellow = UIColor(red: 255, green: 210, blue: 51)
    public static let revelCellBlue = UIColor(red: 38, green: 153, blue: 202)
    public static let redWarningColor = UIColor(red: 233, green: 52, blue: 0)
    public static let placeholderColor = UIColor(red: 95, green: 95, blue: 95)
    public static let orangeWarningColor = UIColor(red: 255, green: 127, blue: 0)
    public static let orangeOptionsColor = UIColor(red: 255, green: 134, blue: 84)
    public static let redTypesColor = UIColor(red: 238, green: 95, blue: 111)
    // new Color
    public static let discountPlaceholderColor = UIColor(red: 230, green: 235, blue: 239)
    public static let revelTextFieldTextColor = UIColor(red: 4, green: 58, blue: 102)
    public static let revelProductRed = UIColor(red: 239, green: 96, blue: 112)
    public static let revelProducGreen = UIColor(red: 145, green: 210, blue: 82)
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red)/255.0,
                  green: CGFloat(green)/255.0,
                  blue: CGFloat(blue)/255.0,
                  alpha: alpha)
    }
}
