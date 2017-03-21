//
//  CoverFadeInAnimation.swift
//  Pods
//
//  Created by Dong Seok Yang on 2017. 3. 21..
//
//

import UIKit

class CoverFadeInAnimation: PresentrAnimation {
    
    open override func customAnimation(using transitionContext: UIViewControllerContextTransitioning) -> Bool {
        
        let containerView = transitionContext.containerView
        
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        let isPresenting: Bool = (toViewController?.presentingViewController == fromViewController)
        
        let animatingVC = isPresenting ? toViewController : fromViewController
        let animatingView = isPresenting ? toView : fromView
        
        let finalFrameForVC = transitionContext.finalFrame(for: animatingVC!)
        let initialFrameForVC = transform(containerFrame: containerView.frame, finalFrame: finalFrameForVC)
        
        let initialFrame = isPresenting ? initialFrameForVC : finalFrameForVC
        
        let duration = transitionDuration(using: transitionContext)
        
        if isPresenting {
            containerView.addSubview(toView!)
        }
        
        animatingView?.frame = initialFrame
        animatingView?.alpha = 0.0
        animatingView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: springDamping,
                       initialSpringVelocity: initialSpringVelocity,
                       options: .allowUserInteraction,
                       animations: {
                        animatingView?.alpha = 1.0
                        animatingView?.transform = CGAffineTransform(scaleX: 1, y: 1)
    
                        
        }, completion: { (value: Bool) in
            if !isPresenting {
                fromView?.removeFromSuperview()
            }
            let wasCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!wasCancelled)
            
        })
        
        
        return true
    }
    
}
