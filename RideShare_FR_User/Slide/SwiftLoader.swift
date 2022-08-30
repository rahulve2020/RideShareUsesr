//
//  BSLoader.swift
//  Cool
//
//  Created by Salman Ghumsani on 07.02.15.
//  Copyright (c) 2015 Cool. All rights reserved.
//

import UIKit
import QuartzCore
import CoreGraphics

let loaderSpinnerMarginSide : CGFloat = 30
let loaderSpinnerMarginTop : CGFloat = 20.0
let loaderTitleMargin : CGFloat = 5.0

public class SwiftLoader: UIView {
    
    private var coverView : UIView?
    private var titleLabel : UILabel?
    private var loadingView : SwiftLoadingView?
    private var animated : Bool = true
    private var canUpdated = false
    private var title: String?
    
    private var config : Config = Config() {
        didSet {
            self.loadingView?.config = config
        }
    }
    
    override public var frame : CGRect {
        didSet {
            
            self.update()
        }
    }
    
    class var sharedInstance: SwiftLoader {
        struct Singleton {
            static let instance = SwiftLoader(frame: CGRect(x: 0, y: 0, width: Config().size, height: Config().size))
        }
        return Singleton.instance
    }
    
    public class func show(animated: Bool) {
        self.show(title: nil, animated: animated)
    }
    
    public class func show(title: String?, animated : Bool) {
        
        guard let currentWindow : UIWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        let loader = SwiftLoader.sharedInstance
        loader.canUpdated = true
        loader.animated = animated
        loader.title = title
        loader.update()
        
        let height : CGFloat = UIScreen.main.bounds.size.height
        let width : CGFloat = UIScreen.main.bounds.size.width
        let center : CGPoint = CGPoint(x:width / 2.0,y: height / 2.0)
        
        loader.center = center
        
        if (loader.superview == nil) {
            loader.coverView = UIView(frame: currentWindow.bounds)
            loader.coverView?.backgroundColor = loader.config.foregroundColor.withAlphaComponent(loader.config.foregroundAlpha)
            
            currentWindow.addSubview(loader.coverView!)
            currentWindow.addSubview(loader)
            loader.start()
        }
    }
    
    public class func hide() {
        let loader = SwiftLoader.sharedInstance
        loader.stop()
    }
    
    public class func setConfig(config : Config) {
        let loader = SwiftLoader.sharedInstance
        loader.config = config
        loader.frame = CGRect(x: 0, y: 0, width: loader.config.size, height: loader.config.size)
    }
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    /**
    Private methods
    */
    
    private func setup() {
        self.alpha = 0
        self.update()
    }
    
    private func start() {
        self.loadingView?.start()
        
        if (self.animated) {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.alpha = 1
                }, completion: { (finished) -> Void in
                    
            });
        } else {
            self.alpha = 1
        }
    }
    
    private func stop() {
        
        if (self.animated) {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.alpha = 0
                }, completion: { (finished) -> Void in
                    self.removeFromSuperview()
                    self.coverView?.removeFromSuperview()
                    self.loadingView?.stop()
            });
        } else {
            self.alpha = 0
            self.removeFromSuperview()
            self.coverView?.removeFromSuperview()
            self.loadingView?.stop()
        }
    }
    
    private func update() {
        self.backgroundColor = self.config.backgroundColor
        self.layer.cornerRadius = self.config.cornerRadius
        let loadingViewSize = self.frame.size.width - (loaderSpinnerMarginSide * 2)
        
        if (self.loadingView == nil) {
            self.loadingView = SwiftLoadingView(frame: self.frameForSpinner())
            self.addSubview(self.loadingView!)
        } else {
            self.loadingView?.frame = self.frameForSpinner()
        }
        
        if (self.titleLabel == nil) {
            self.titleLabel = UILabel(frame: CGRectMake(loaderTitleMargin, loaderSpinnerMarginTop + loadingViewSize, self.frame.width - loaderTitleMargin*2, 42.0))
            self.addSubview(self.titleLabel!)
            self.titleLabel?.numberOfLines = 1
            self.titleLabel?.textAlignment = NSTextAlignment.center
            self.titleLabel?.adjustsFontSizeToFitWidth = true
        } else {
            self.titleLabel?.frame = CGRectMake(loaderTitleMargin, loaderSpinnerMarginTop + loadingViewSize, self.frame.width - loaderTitleMargin*2, 42.0)
        }
        
        self.titleLabel?.font = self.config.titleTextFont
        self.titleLabel?.textColor = self.config.titleTextColor
        self.titleLabel?.text = self.title
        
        self.titleLabel?.isHidden = self.title == nil
    }
    
    func frameForSpinner() -> CGRect {
        let loadingViewSize = self.frame.size.width - (loaderSpinnerMarginSide * 2)
        
        if (self.title == nil) {
            let yOffset = (self.frame.size.height - loadingViewSize) / 2
            return CGRectMake(loaderSpinnerMarginSide, yOffset, loadingViewSize, loadingViewSize)
        }
        return CGRectMake(loaderSpinnerMarginSide, loaderSpinnerMarginTop, loadingViewSize, loadingViewSize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
    *  Loader View
    */
    class SwiftLoadingView : UIView {
        
        private var lineWidth : Float?
        private var lineTintColor : UIColor?
        private var backgroundLayer : CAShapeLayer?
        private var isSpinning : Bool?
        
         var config : Config = Config() {
            didSet {
                self.update()
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        /**
        Setup loading view
        */
        
         func setup() {
            self.backgroundColor = UIColor.clear
            self.lineWidth = fmaxf(Float(self.frame.size.width) * 0.025, 1)
            
            self.backgroundLayer = CAShapeLayer()
            self.backgroundLayer?.strokeColor = self.config.spinnerColor.cgColor
            self.backgroundLayer?.fillColor = self.backgroundColor?.cgColor
            self.backgroundLayer?.lineCap = CAShapeLayerLineCap.round
            self.backgroundLayer?.lineWidth = CGFloat(self.lineWidth!)
            self.layer.addSublayer(self.backgroundLayer!)
        }
        
         func update() {
            self.lineWidth = self.config.spinnerLineWidth
            
            self.backgroundLayer?.lineWidth = CGFloat(self.lineWidth!)
            self.backgroundLayer?.strokeColor = self.config.spinnerColor.cgColor
        }
        
        /**
        Draw Circle
        */
        
        override func draw(_ rect: CGRect) {
            self.backgroundLayer?.frame = self.bounds
        }
        
         func drawBackgroundCircle(partial : Bool) {
            let startAngle : CGFloat = CGFloat(Double.pi) / CGFloat(2.0)
            var endAngle : CGFloat = (2.0 * CGFloat(Double.pi)) + startAngle
            
            let center : CGPoint = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
                
               // CGPoint(self.bounds.size.width / 2, self.bounds.size.height / 2)
            let radius : CGFloat = (CGFloat(self.bounds.size.width) - CGFloat(self.lineWidth!)) / CGFloat(2.0)
            
            let processBackgroundPath : UIBezierPath = UIBezierPath()
            processBackgroundPath.lineWidth = CGFloat(self.lineWidth!)
            
            if (partial) {
                endAngle = (1.8 * CGFloat(Double.pi)) + startAngle
            }
            
            processBackgroundPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            self.backgroundLayer?.path = processBackgroundPath.cgPath;
        }

        /**
        Start and stop spinning
        */
        
         func start() {
            self.isSpinning? = true
            self.drawBackgroundCircle(partial: true)
            
            let rotationAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.toValue = NSNumber(value: Double.pi * 2.0)
            rotationAnimation.duration = 1;
            rotationAnimation.isCumulative = true;
            rotationAnimation.repeatCount = HUGE;
            self.backgroundLayer?.add(rotationAnimation, forKey: "rotationAnimation")
        }
        
         func stop() {
            self.drawBackgroundCircle(partial: false)
            
            self.backgroundLayer?.removeAllAnimations()
            self.isSpinning? = false
        }
    }
    
    
    /**
    * Loader config
    */
    public struct Config {
        
        /**
        *  Size of loader
        */
        public var size : CGFloat = 90.0
        
        /**
        *  Color of spinner view
        */
        public var spinnerColor = UIColor.gray
        
        /**
        *  S
        */
        public var spinnerLineWidth :Float = 1.0
        
        /**
        *  Color of title text
        */
        public var titleTextColor = UIColor.gray
        
        /**
        *  Font for title text in loader
        */
        public var titleTextFont : UIFont = UIFont.boldSystemFont(ofSize: 14.0)
        
        /**
        *  Background color for loader
        */
        public var backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        /**
        *  Foreground color
        */
        public var foregroundColor = UIColor.black
        
        /**
        *  Foreground alpha CGFloat, between 0.0 and 1.0
        */
        public var foregroundAlpha:CGFloat = 0.5
        
        /**
        *  Corner radius for loader
        */
        public var cornerRadius : CGFloat = 10.0
        
        public init() {}
        
    }
}
