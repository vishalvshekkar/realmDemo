//
//  StoryboardIdentity.swift
//  RealmDemo
//
//  Created by Vishal on 11/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit

protocol StoryboardIdentity {
    
    static var storyboardIdentifier: String { get }
    
}

extension StoryboardIdentity {
    
    static var storyboardIdentifier: String { return String(Self) }
    
}

extension UIStoryboard {
    
    enum StoryboardType: String {
        case Main
        
        //Darshan's suggestion and minor improvements on it.
        func instantiateViewController<T: UIViewController where T: StoryboardIdentity>() -> T? {
            return UIStoryboard(name: self.rawValue, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(T.storyboardIdentifier) as? T
        }
    }
    
    static func instantiateStoryboardOfType(type: StoryboardType) -> UIStoryboard? {
        return UIStoryboard(name: type.rawValue, bundle: NSBundle.mainBundle())
    }
    
    func instantiateViewController<T: UIViewController where T: StoryboardIdentity>(_: T.Type) -> T? {
        return self.instantiateViewControllerWithIdentifier(T.storyboardIdentifier) as? T
    }
    
}