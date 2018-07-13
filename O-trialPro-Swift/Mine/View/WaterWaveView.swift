//
//  WaterWaveView.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/25.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit

/// 波浪~~~
class WaterWaveView: UIView {

    /// 振幅
    var waveAmplitude: Double?
    /// 周期
    var waveCycle: Double?
    /// 速度
    var waveSpeed: Double?
    var waveHeight: Double?
    var waveWidth: Double?
    var wavePointY: Double?
    /// 波浪x位移
    var waveOffsetX: Double?
    /// 波浪颜色
    var waveColor: UIColor?
    
    private var startColor: UIColor?
    private var endColor: UIColor?
//    lazy var displayLink: CADisplayLink = {
//        let link = CADisplayLink(target: self, selector: #selector(self.getCurrentWave))
//        return link
//    }()
    lazy var shapeLayer1: CAShapeLayer = {
        let layer = CAShapeLayer()
        return layer
    }()
    
    lazy var shapeLayer2: CAShapeLayer = {
        let layer = CAShapeLayer()
        return layer
    }()

    lazy var gradidentLayer1: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [self.startColor!.cgColor, self.endColor!.cgColor]
        layer.locations = [NSNumber(value: 0), NSNumber(value: 1.0)]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1.0, y: 0)
        
        return layer
    }()
    lazy var gradientLayer2: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [self.startColor!.cgColor, self.endColor!.cgColor]
        layer.locations = [NSNumber(value: 0), NSNumber(value: 1.0)]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1.0, y: 0)
        return layer
    }()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, _ startColor: UIColor, _ endColor: UIColor) {
        self.startColor = startColor
        self.endColor = endColor
        super.init(frame: frame)
        
        self.backgroundColor = HexColor("edf0f4", 0.1)
        self.layer.masksToBounds = true
        
        configParams()
        startWave()
        
    }
    
    
    //  MARK:   - 配置参数
    func configParams() {
        if waveWidth == nil {
            waveWidth = Double(self.ot_wid)
        }
        if waveHeight == nil {
            waveHeight = 7.5
        }
        //  背景色
        if waveColor == nil {
            waveColor = .white
        }
        if waveSpeed == nil {
            waveSpeed = 2.0
        }
        if waveOffsetX == nil {
            waveOffsetX = 0
        }
        if wavePointY == nil {
            wavePointY = Double(self.ot_hei) - waveHeight! * 2
        }
        if waveAmplitude == nil {
            waveAmplitude = waveHeight
        }
        if waveCycle == nil {
            waveCycle = 1.29 * Double.pi / waveWidth!
        }
        
    }
    
    //  MARK:   - 加载layer, 绑定runloop 帧刷新
    func startWave() {
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(self.getCurrentWave))
        displayLink.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    //  MARK:   -   帧动画
    @objc func getCurrentWave() {
        waveOffsetX = waveOffsetX! + waveSpeed!
        changeFirstWaveLayerPath()
        changeSecondWaveLayerPath()
        
        self.layer.addSublayer(self.gradidentLayer1)
        self.gradidentLayer1.mask = shapeLayer1
        self.layer.addSublayer(self.gradientLayer2)
        self.gradientLayer2.mask = shapeLayer2
        
    }
    
    //  MARK:   - 路径
    func changeFirstWaveLayerPath() {
        let path = CGMutablePath()
        var y = wavePointY
        
        path.move(to: CGPoint(x: 0, y: y!))
        var x: Double = 0
        while x < waveWidth! {
            let temp = 250/waveWidth! * (x*Double.pi/180) - waveOffsetX!*Double.pi/270
            y = waveAmplitude!*1.6*sin(temp) + wavePointY!
            path.addLine(to: CGPoint(x: x, y: y!))
            x += 1
        }
        path.addLine(to: CGPoint(x: waveWidth!, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        shapeLayer1.path = path
        //  CGPathRelease对应方法未找到
        
    }
    
    func changeSecondWaveLayerPath() {
        let path = CGMutablePath()
        var y = wavePointY
        
        path.move(to: CGPoint(x: 0, y: y!))
        var x: Double = 0
        while x < waveWidth! {
            let temp = 250/waveWidth! * (x*Double.pi/180) - waveOffsetX!*Double.pi/180
            y = waveAmplitude!*1.6*sin(temp) + wavePointY!
            path.addLine(to: CGPoint(x: x, y: y!))
            x += 1
        }
        path.addLine(to: CGPoint(x: waveWidth!, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        shapeLayer2.path = path
        //  CGPathRelease对应方法未找到
        
    }
    
    
    
    
}
