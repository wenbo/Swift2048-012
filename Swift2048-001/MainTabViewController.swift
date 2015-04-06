//
//  MainTabViewController.swift
//  Swift2048-002
//
//  Created by wuxing on 14-6-9.
//  Copyright (c) 2014年 优才网（www.ucai.cn）. All rights reserved.
//

import UIKit

class MainTabViewController:UITabBarController
{
    override init()
    {
        super.init(nibName:nil, bundle:nil)
        
        var viewMain = MainViewController()
        
        viewMain.title = "2048"
        
        var viewSetting = SettingViewController(mainview:viewMain)
        
        viewSetting.title = "设置"
        
        
        var main = UINavigationController(rootViewController:viewMain)
        var setting = UINavigationController(rootViewController:viewSetting)
        
        self.viewControllers = [
            main, setting
        ]
        
        self.selectedIndex = 0
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
