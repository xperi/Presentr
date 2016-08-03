//
//  TransFormer.swift
//  Presentr
//
//  Created by xperi on 2016. 8. 3..
//  Copyright © 2016년 danielozano. All rights reserved.
//

import UIKit

class TransFormer {
    var transitionContext: UIViewControllerContextTransitioning
    var containerView: UIView?
    var fromViewController: UIViewController?
    var toViewController: UIViewController?
    var fromView: UIView?
    var toView: UIView?
    var isPresenting: Bool = false
    var animatingVC: UIViewController?
    var animatingView: UIView?

    init(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        guard let containerView = transitionContext.containerView() else {
                return
        }
        self.containerView = containerView
        self.fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        self.toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        self.fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        self.toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        self.isPresenting = (toViewController?.presentingViewController == fromViewController)
        self.animatingVC = isPresenting ? toViewController : fromViewController
        self.animatingView = isPresenting ? toView : fromView

        if let toView = self.toView where isPresenting {
            containerView.addSubview(toView)
        }

    }

    func isValidTransFromer() -> Bool {
        return containerView != nil
    }

    func transFormWillAnimation() {

    }

    func transFormDidAnimation() {

    }

    func transFormCompletionAnimation() {
        if !isPresenting {
            fromView?.removeFromSuperview()
        }
    }
}
