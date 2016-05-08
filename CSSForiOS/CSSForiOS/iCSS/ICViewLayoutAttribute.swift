//
//  ICViewLayout.swift
//  CSSForiOS
//
//  Created by ZeluLi on 16/5/8.
//  Copyright © 2016年 zeluli. All rights reserved.
//
import UIKit

class ICViewLayoutAttribute: NSObject {
    private var view: IC_VIEW?
    private var item: AnyObject?
    private var layoutAttribute: IC_LayoutAttribute?
    
    init(view: IC_VIEW, item: AnyObject, layoutAttribute: IC_LayoutAttribute) {
        self.view = view
        self.item = item
        self.layoutAttribute = layoutAttribute
    }
    
    convenience init(view: IC_VIEW, layoutAttribute: IC_LayoutAttribute) {
        self.init(view: view, item: view, layoutAttribute: layoutAttribute)
    }
    
    func isSizeAttribute() -> Bool {
        return self.layoutAttribute == NSLayoutAttribute.Width
            || self.layoutAttribute == NSLayoutAttribute.Height;
    }
    
}

func == (left: ICViewLayoutAttribute, right: ICViewLayoutAttribute) -> Bool {
    return left.view == right.view && left.layoutAttribute == right.layoutAttribute
}