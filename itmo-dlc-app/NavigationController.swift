//
//  NavigationController.swift
//  itmo-dlc-app
//
//  Created by Pomavau on 26.12.2018.
//  Copyright © 2018 Andrei Vlasov. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    override var shouldAutorotate : Bool {
        return true
    }
    
//    override var prefersStatusBarHidden : Bool {
//        return UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == .phone
//    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return sideMenuController!.isRightViewVisible ? .slide : .fade
    }
    
}
