//
//  CombineTransFormer.swift
//  Presentr
//
//  Created by Dong Seok Yang on 2016. 8. 3..
//  Copyright © 2016년 danielozano. All rights reserved.
//

import UIKit
typealias CombineTransformerBlock = (initAnimationView: (animationView: UIView?) -> Void, finalAnimationView: (animationView: UIView?) -> Void)
class CombineTransFormer: TransFormer {
    var combineTransformerBlock: CombineTransformerBlock?

    init(transitionContext: UIViewControllerContextTransitioning, transform: CombineTransformerBlock?) {
        super.init(transitionContext: transitionContext)
        self.combineTransformerBlock = transform
    }

    override func transFormWillAnimation() {
        if !self.isPresenting {
            combineTransformerBlock?.finalAnimationView(animationView: self.animatingView)
        } else {
            combineTransformerBlock?.initAnimationView(animationView: self.animatingView)
        }


    }

    override func transFormDidAnimation() {
        if !self.isPresenting {
            combineTransformerBlock?.initAnimationView(animationView: self.animatingView)
        } else {
            combineTransformerBlock?.finalAnimationView(animationView: self.animatingView)

        }

    }

    override func transFormCompletionAnimation() {

    }

}
