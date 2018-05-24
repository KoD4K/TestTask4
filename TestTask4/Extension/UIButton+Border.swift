//
//  UIButton+Border.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 21/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}
