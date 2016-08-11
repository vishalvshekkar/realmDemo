//
//  Constants.swift
//  RealmDemo
//
//  Created by Vishal V Shekkar on 10/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit

struct Constants {
    
}

extension UIColor {
    
    enum ColorType {
        case PinkishRed
        case PinkishRedWith15Alpha
        case PinkishRedWith30Alpha
    }
    
    convenience init(colorType: ColorType) {
        switch colorType {
        case .PinkishRed:
            self.init(red: 1, green: 14.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        case .PinkishRedWith15Alpha:
            self.init(red: 1, green: 14.0/255.0, blue: 76.0/255.0, alpha: 0.15)
        case .PinkishRedWith30Alpha:
            self.init(red: 1, green: 14.0/255.0, blue: 76.0/255.0, alpha: 0.30)
        default:
            self.init(red: 1, green: 1, blue: 1, alpha: 1.0)
        }
        
    }
}

extension UIView {
    
    static func animateWithDurationAndBool(duration: NSTimeInterval, animated: Bool, animation: () -> ()) {
        if animated {
            UIView.animateWithDuration(duration, animations: animation)
        } else {
            animation()
        }
    }
    
}