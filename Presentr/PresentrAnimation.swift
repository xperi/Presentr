//
//  PresentrAnimation.swift
//  Presentr
//
//  Created by Daniel Lozano on 5/14/16.
//  Copyright © 2016 danielozano. All rights reserved.
//

import Foundation
/**
 *  Protocol that represents a custom PresentrAnimation. Conforms to 'UIViewControllerAnimatedTransitioning'
 */
protocol PresentrAnimation: UIViewControllerAnimatedTransitioning {

    /// The duration for the animation. Must be set by the class that implements protocol.
    var animationDuration: NSTimeInterval { get set }

    /**
     This method has a default implementation by the 'PresentrAnimation' extension. It handles animating the view controller.

     - parameter transitionContext: Receives the transition context from the class implementing the protocol
     - parameter transform:         Transform block used to obtain the initial frame for the animation, given the finalFrame and the container's frame.

     */
    func animate(transitionContext: UIViewControllerContextTransitioning, trandFormer: TransFormer)

}

extension PresentrAnimation {

    func animate(transitionContext: UIViewControllerContextTransitioning, trandFormer: TransFormer) {

        if !trandFormer.isValidTransFromer() {
            return
        }

        let duration = transitionDuration(transitionContext)
        trandFormer.transFormWillAnimation()

        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 300.0, initialSpringVelocity: 5.0, options: .AllowUserInteraction, animations: {

            trandFormer.transFormDidAnimation()

            }, completion: { (value: Bool) in
                trandFormer.transFormCompletionAnimation()

                let wasCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!wasCancelled)

        })
    }

}
