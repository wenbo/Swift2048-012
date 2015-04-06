//
//  ScoreView.swift
//  Swift2048-010
//
//  Created by wuxing on 14-6-9.
//  Copyright (c) 2014年 优才网（www.ucai.cn）. All rights reserved.
//

import UIKit

protocol ScoreViewProtocol{
    func changeScore(value s:Int)
}

class ScoreView:UIView, ScoreViewProtocol
{
    var label:UILabel
    
    let defaultFrame = CGRectMake(0,0,100,30)
    
    var score:Int = 0{
    didSet{
        label.text = "分数:\(score)"
    }
    }
    
    override init()
    {
        label = UILabel(frame:defaultFrame)
        label.textAlignment = NSTextAlignment.Center
        
        super.init(frame:defaultFrame)
        
        backgroundColor = UIColor.orangeColor()
        label.font = UIFont(name:"微软雅黑", size:16)
        label.textColor = UIColor.whiteColor()
        self.addSubview(label)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeScore(value s:Int)
    {
        score = s
    }
}

class BestScoreView:ScoreView, ScoreViewProtocol
{
    var bestscore:Int  = 0{
    didSet{
        label.text = "最高分:\(bestscore)"
    }
    }
    
    override func changeScore(value s:Int)
    {
        bestscore = s
    }
}

