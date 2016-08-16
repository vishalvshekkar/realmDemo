//
//  AnimationController.swift
//  RealmDemo
//
//  Created by Vishal on 11/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit

struct AnimationHelper {
    static func yRotation(angle: Double) -> CATransform3D {
        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
    }
    
    static func perspectiveTransformForContainerView(containerView: UIView) {
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
    }
}

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var destinationFrame = CGRectZero

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        let finalFrame = destinationFrame
        
        let snapshot = fromVC.view.snapshotViewAfterScreenUpdates(false)
        
        snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        fromVC.view.hidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(containerView)
        
        toVC.view.layer.transform = AnimationHelper.yRotation(-M_PI_2)
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModeCubic,
            animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: {
                    snapshot.frame = finalFrame
                })
                
                UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
                    snapshot.layer.transform = AnimationHelper.yRotation(M_PI_2)
                })
                
                UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
                    toVC.view.layer.transform = AnimationHelper.yRotation(0.0)
                })
            },
            completion: { _ in
                fromVC.view.hidden = false
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
    
    
    func animationEnded(transitionCompleted: Bool) {
        
    }
    
}
