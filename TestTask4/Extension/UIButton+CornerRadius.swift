//
//  UIView+CornerRadius.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 20/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton : UIButton {
}

extension UIButton {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
