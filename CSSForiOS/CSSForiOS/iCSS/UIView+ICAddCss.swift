//
//  UIView+AddCss.swift
//  CSSForiOS
//
//  Created by ZeluLi on 16/5/8.
//  Copyright © 2016年 zeluli. All rights reserved.
//

import UIKit
extension UIView {
    
    func addCssWithId(css: ICDictionary) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraintFactory = ICStyleFactory.init(css: css, view: self)
        constraintFactory.addCss()
        self.ic_all_style = css;
    }

        
    private struct AssociatedKeys {
        static var icDictionary = "ic_dictionary"
    }
    
    var ic_all_style: ICDictionary {
        get {
            guard let icDic = objc_getAssociatedObject(self, &AssociatedKeys.icDictionary) as? ICDictionary else {
                let cssDic = ICDictionary()
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.icDictionary,
                    cssDic,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
                return cssDic
            }
            return icDic
        }
        
        set {
            if let newValue: ICDictionary = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.icDictionary,
                    newValue,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}
