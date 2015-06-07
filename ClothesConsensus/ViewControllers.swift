//
//  ViewControllers.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 3/30/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class ViewControllers: NSObject {

    class func loginViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as LoginViewController
        return loginViewController
    }

    class func looksListingViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "LooksListingStoryboard", bundle: nil)
        let looksListingViewController = storyboard.instantiateViewControllerWithIdentifier("LooksListingViewController") as LooksListingViewController
        return looksListingViewController
    }

    class func looksListingNavigationController() -> UIViewController {
        let storyboard = UIStoryboard(name: "LooksListingStoryboard", bundle: nil)
        let looksListingNavigationController = storyboard.instantiateViewControllerWithIdentifier("LooksListingNavigationController") as UINavigationController
        return looksListingNavigationController
    }

    class func cameraViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "CameraStoryboard", bundle: nil)
        let cameraNavigationController = storyboard.instantiateViewControllerWithIdentifier("CameraNavigationController") as UINavigationController
        return cameraNavigationController
    }


}
