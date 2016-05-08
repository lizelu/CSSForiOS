//
//  ICDictionaryIterator.swift
//  CSSForiOS
//
//  Created by ZeluLi on 16/5/8.
//  Copyright © 2016年 zeluli. All rights reserved.
//

import Foundation

//迭代器
protocol Iterator {
    func hasNext() -> Bool
    func nextValue() -> AnyObject?
    func nextKey() -> String
}

class DictionaryIterator: Iterator {
    
    private let items: ICDictionary
    private var valuePosition: Int = 0
    private var keyPosition: Int = 0
    var allKeys: [String] {
        get{
            return Array(items.keys)
        }
    }
    
    class func createIterator(items: ICDictionary) -> Iterator {
        return DictionaryIterator(items: items)
    }
    
    init(items: ICDictionary) {
        self.items = items
    }
    
    func hasNext() -> Bool {
        return valuePosition < items.count
    }
    
    func nextValue() -> AnyObject? {
        let item = items[allKeys[valuePosition]]
        valuePosition += 1
        keyPosition = valuePosition
        return item
    }
    
    func nextKey() -> String {
        return allKeys[keyPosition];
    }
}
