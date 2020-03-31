//
//  YBSHudExtensions.swift
//  YBS_HUD
//
//  Created by pzy on 2020/3/30.
//  Copyright © 2020 pzy. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    private struct AssociatedKeys {
        static var chrysanViewKey = "Chrysan.ChrysanKey"
    }
    
    var YBSHUD: YBSHud {
        get {
            var hud = objc_getAssociatedObject(self, &AssociatedKeys.chrysanViewKey) as? YBSHud
            if hud == nil {
                hud = YBSHud.ybsHud(withView: self)
                self.YBSHUD = hud!
            }
            return hud!
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.chrysanViewKey, newValue as YBSHud, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public extension UIViewController {
    
    var YBSHud: YBSHud {
        get {
            return view.YBSHUD
        }
        set {
            view.YBSHUD = newValue
        }
    }
}
