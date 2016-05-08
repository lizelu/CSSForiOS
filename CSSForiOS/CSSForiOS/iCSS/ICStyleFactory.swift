//
//  ICConstraintFactory.swift
//  CSSForiOS
//
//  Created by ZeluLi on 16/5/8.
//  Copyright © 2016年 zeluli. All rights reserved.
//

import UIKit

let ic_red = UIColor.redColor()
let ic_green = UIColor.greenColor()
let ic_gray = UIColor.grayColor()
let ic_yellow = UIColor.yellowColor()

let ic_background_color = "background_color"


let ic_top = "ic_top"
let ic_left = "ic_left"
let ic_right = "ic_right"
let ic_bottom = "ic_bottom"
let ic_width = "ic_width"
let ic_height = "ic_height"

let icLayoutAttributeMap = createLayoutAttributeMap()

private func createLayoutAttributeMap() -> Dictionary<String, NSLayoutAttribute> {
    var maps = Dictionary<String, NSLayoutAttribute>()
    maps[ic_top] = NSLayoutAttribute.Top
    maps[ic_left] = NSLayoutAttribute.Left
    maps[ic_bottom] = NSLayoutAttribute.Bottom
    maps[ic_right] = NSLayoutAttribute.Right
    maps[ic_width] = NSLayoutAttribute.Width
    maps[ic_height] = NSLayoutAttribute.Height
    
    return maps
}

func isLayoutConstraint(attribute: String) -> Bool {
    return attribute == ic_top ||
        attribute == ic_left ||
        attribute == ic_right ||
        attribute == ic_bottom ||
        attribute == ic_width ||
        attribute == ic_height
}

func isSizeAttribute(attribute: String) -> Bool {
    return attribute == ic_width ||
        attribute == ic_height
}


class ICStyleFactory {
    weak var view: IC_VIEW?
    var cssDic: ICDictionary
    init(css: ICDictionary, view: IC_VIEW) {
        self.cssDic = css
        self.view = view
    }
    
    func addCss() {
        let iterator = DictionaryIterator.createIterator(cssDic)
        while(iterator.hasNext()) {
            
            let nextKey = iterator.nextKey();
            let nextValue = iterator.nextValue();
            
            
            if isLayoutConstraint(nextKey)  {       //判断是否为布局属性
                
                if let value = nextValue as? CGFloat {
                    print(value)
                    self.addLayoutConstraint(nextKey, constant: value)
                    continue
                }
                continue
            }
            
            if  nextKey == ic_background_color {
                
                
                if let value = nextValue as? UInt {
                    self.view?.backgroundColor = colorChangeWithHex(value)
                    continue
                }
                
                if let color = nextValue as? UIColor  {
                    self.view?.backgroundColor = color
                    continue
                }
                
                continue
            }

        }
    }
    
    
    func addLayoutConstraint(constraintType: String, constant: CGFloat) {
        
        guard let layoutAttribute: NSLayoutAttribute = icLayoutAttributeMap[constraintType] else {
            return
        }
        
        let firstItem = self.view!
        var secondItem = self.view?.superview
        var installView: UIView = (self.view?.superview!)!
        
        if isSizeAttribute(constraintType) {
            secondItem = nil
            installView = self.view!
        }
        
        
        let layoutConstraint = NSLayoutConstraint.init(
            item: firstItem,
            attribute: layoutAttribute,
            relatedBy: NSLayoutRelation.Equal,
            toItem: secondItem,
            attribute: layoutAttribute,
            multiplier: 1,
            constant: constant)
        
        installView.addConstraint(layoutConstraint)
    }
}