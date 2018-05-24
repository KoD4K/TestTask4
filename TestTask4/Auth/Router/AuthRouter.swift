//
//  AuthRouter.swift
//  TestTask4
//
//  Created by Evgeny Plenkin on 24/05/2018.
//  Copyright © 2018 Evgeny Plenkin. All rights reserved.
//

import UIKit

class AuthRouter {
    private let viewController: UIViewController
    
    init(withRootViewController viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlertView(withMessage message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        alertController.addAction(okAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}

