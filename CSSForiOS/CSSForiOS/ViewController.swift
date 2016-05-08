//
//  ViewController.swift
//  CSSForiOS
//
//  Created by ZeluLi on 16/5/8.
//  Copyright © 2016年 zeluli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  testView1 = UIView.init()
        self.view.addSubview(testView1)
        
        let  testView2 = UIView.init()
        self.view.addSubview(testView2)
        
        let testView3 = UIView.init()
        testView1.addSubview(testView3)
        
        
        
        testView1.addCssWithId(ic_div1)
        testView2.addCssWithId(ic_div2)
        testView3.addCssWithId(ic_div3)

        
        print(testView1.ic_all_style)
        print(testView2.ic_all_style)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

