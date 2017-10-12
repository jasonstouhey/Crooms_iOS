//
//  Transitioner.swift
//  TechFest
//
//  Created by Suneet Tipirneni on 10/12/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

class Transitioner: NSObject, UIViewControllerAnimatedTransitioning{
    var reverse: Bool = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toView = toViewController.view
        let fromView = fromViewController.view
        let direction: CGFloat = reverse ? -1 : 1
        let const: CGFloat = -0.005
        
        toView?.layer.anchorPoint = CGPoint(x: direction == 1 ? 0 : 1, y: 0.5)
        fromView?.layer.anchorPoint = CGPoint(x: direction == 1 ? 1 : 0, y: 0.5)
        
        var viewFromTransform = CGAffineTransform(rotationAngle: 50)
        var viewToTransform = CGAffineTransform(rotationAngle: -50)
        
        
        containerView.transform = CGAffineTransform(translationX: direction * containerView.frame.size.width / 2.0, y: 0)
        toView?.transform = CGAffineTransform(rotationAngle: -50)
        containerView.addSubview(toView!)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            containerView.transform = CGAffineTransform(translationX: -direction * containerView.frame.size.width / 2.0, y: 0)
            fromView?.transform = CGAffineTransform(rotationAngle: -50)
            toView?.layer.transform = CATransform3DIdentity
            
        }, completion:{ finished in
            containerView.transform = CGAffineTransform.identity
            fromView?.layer.transform = CATransform3DIdentity
            toView?.layer.transform = CATransform3DIdentity
            fromView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            if (transitionContext.transitionWasCancelled) {
            toView?.removeFromSuperview()
            } else {
            fromView?.removeFromSuperview()
            }
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        })
       
}
}
