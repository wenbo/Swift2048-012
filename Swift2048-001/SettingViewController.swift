//
//  SettingViewController.swift
//  Swift2048-002
//
//  Created by wuxing on 14-6-9.
//  Copyright (c) 2014年 优才网（www.ucai.cn）. All rights reserved.
//

import UIKit

class SettingViewController:UIViewController, UITextFieldDelegate
{
    var mainview:MainViewController
    
    var txtNum:UITextField!
    
    var segDimension:UISegmentedControl!
    
    init(mainview:MainViewController)
    {
        self.mainview = mainview
        super.init(nibName:nil, bundle:nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setupController()
    }
    
    func setupController()
    {
        var cv = ControlView()
        
        txtNum = cv.createTextField(String(self.mainview.maxnumber)
            ,action:Selector("numChanged"), sender:self)
        
        txtNum.frame.origin.x = 50
        txtNum.frame.origin.y = 100
        txtNum.frame.size.width = 200
        txtNum.returnKeyType = UIReturnKeyType.Done
        
        
        self.view.addSubview(txtNum)
        
        segDimension = cv.createSegment(["3x3", "4x4", "5x5"], action:"dimensionChanged:", sender:self)
        
        segDimension.frame.origin.x = 50
        segDimension.frame.origin.y = 200
        segDimension.frame.size.width = 200
        
        self.view.addSubview(segDimension)
        
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        println("num Changed!")
        
        if(textField.text != "\(mainview.maxnumber)")
        {
            var num = textField.text.toInt()
            mainview.maxnumber = num!
        }
        return true
    }
    
    func dimensionChanged(sender:SettingViewController)
    {
        var segVals = [3,4,5]
        mainview.dimension  = segVals[segDimension.selectedSegmentIndex]
        
        mainview.resetTapped()
        
    }
    
}
