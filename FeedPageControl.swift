//
//  FeedPageControl.swift
//  SketchMe
//
//  Created by Yihe Li on 1/19/15.
//  Copyright (c) 2015 Yihe Li. All rights reserved.
//

import UIKit

class FeedPageControl: UIPageControl {

    let activeCircle = UIImage(named: "PageCircleActive")!
    let inactiveCircle = UIImage(named: "PageCircleInactive")!
    let activePlus = UIImage(named: "PagePlusActive")!
    let inactivePlus = UIImage(named: "PagePlusInactive")!
    
    var starPosition: Int = 0 {
        didSet {
            updateDots()
        }
    }
    var plusPosition = 0
    
    let ratio = CGFloat(1.3)

    dynamic override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    private func updateDots() {
        for i in 0..<subviews.count {
            let dot = imageViewForSubview(subviews[i] as! UIView)
            if i == currentPage {
                switch i {
                case plusPosition:
                    dot.image = activePlus
                default:
                    dot.image = activeCircle
                }
            }
            else {
                switch i {
                case plusPosition:
                    dot.image = inactivePlus
                default:
                    dot.image = inactiveCircle
                }
            }
        }
    }
    
    private func imageViewForSubview(view : UIView) -> UIImageView {
        var dot: UIImageView!
        if view.isKindOfClass(UIView) {
            for subview in view.subviews {
                if subview.isKindOfClass(UIImageView) {
                    dot = subview as? UIImageView
                    break
                }
            }
            if dot == nil {
                dot = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(view.frame) * ratio, CGRectGetHeight(view.frame) * ratio))
                view.addSubview(dot)
            }
        } else {
            dot = view as? UIImageView
        }
        let center = dot.center
        return dot
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageIndicatorTintColor = UIColor.clearColor()
        currentPageIndicatorTintColor = UIColor.clearColor()
    }
    
}
