//
//  ICUtilities.swift
//  CSSForiOS
//
//  Created by ZeluLi on 16/5/8.
//  Copyright © 2016年 zeluli. All rights reserved.
//

import UIKit

typealias IC_VIEW = UIView
typealias IC_LayoutAttribute = NSLayoutAttribute
typealias ICDictionary = Dictionary<String, AnyObject>

func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
}

func colorChangeWithHex(hex: UInt) -> UIColor {
    let r: CGFloat = CGFloat((hex & 0xff0000) >> 16)
    let g: CGFloat = CGFloat((hex & 0x00ff00) >> 8)
    let b: CGFloat = CGFloat(hex & 0x0000ff)
    
    return rgb(r, green: g, blue: b)
}


