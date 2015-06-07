//
//  LoginViewController.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 3/30/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginTemp(sender: AnyObject) {
        let nextScreen = ViewControllers.looksListingNavigationController() as UINavigationController
        self.view.window?.rootViewController = nextScreen
    }
}
