//
//  FrameTransFormer.swift
//  Presentr
//
//  Created by Dong Seok Yang on 2016. 8. 3..
//  Copyright © 2016년 danielozano. All rights reserved.
//

import UIKit
typealias FrameTransformerBlock = (finalFrame: CGRect, containerFrame: CGRect) -> CGRect

class FrameTransFormer: TransFormer {
    var finalFrameForVC: CGRect?
    var initialFrameForVC: CGRect?

    init(transitionContext: UIViewControllerContextTransitioning, transform: FrameTransformerBlock) {
        super.init(transitionContext: transitionContext)

        if let animatingVC = self.animatingVC, containerView = self.containerView {
            let finalFrameForVC = transitionContext.finalFrameForViewController(animatingVC)
            self.finalFrameForVC = finalFrameForVC
            self.initialFrameForVC = transform(finalFrame: finalFrameForVC, containerFrame: containerView.frame)
        }

    }

    override func transFormWillAnimation() {
        if let frame = self.isPresenting ? initialFrameForVC : finalFrameForVC {
            self.animatingView?.frame = frame
        }
    }

    override func transFormDidAnimation() {
        if let frame = self.isPresenting ? finalFrameForVC : initialFrameForVC {
            self.animatingView?.frame = frame
        }
    }

    override func transFormCompletionAnimation() {

    }
}
