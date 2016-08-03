//
//  CoverFadeInAnimation.swift
//  Presentr
//
//  Created by xperi on 2016. 8. 3..
//  Copyright © 2016년 danielozano. All rights reserved.
//

import Foundation

class CoverFadeInAnimation: NSObject, PresentrAnimation {

    var animationDuration: NSTimeInterval

    init(animationDuration: NSTimeInterval = 0.5) {
        self.animationDuration = animationDuration
    }

}

// MARK: UIViewControllerAnimatedTransitioning

extension CoverFadeInAnimation: UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationDuration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let combineTransformerBlock = CombineTransformerBlock({ animationView in
            if let animationView = animationView {
                animationView.alpha = 0.0
                animationView.transform = CGAffineTransformMakeScale(0.8, 0.8)
            }

            }, finalAnimationView: {  animationView in
                if let animationView = animationView {
                    animationView.alpha = 1.0
                    animationView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                }


        })
        let combineTransFormer = CombineTransFormer(transitionContext: transitionContext, transform: combineTransformerBlock)
        animate(transitionContext, trandFormer: combineTransFormer)
    }

}
