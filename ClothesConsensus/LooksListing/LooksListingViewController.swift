//
//  LooksListingViewController.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 3/30/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class LooksListingViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var looksTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        looksTableView.dataSource = self
        looksTableView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lookCell") as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    @IBAction func lookSliderSlid(sender: UISlider) {
        println("Touch Drag Exit")
        
        
    
    }
    
    
    
    @IBAction func cameraButtonPressed(sender: UIBarButtonItem) {
        let cameraViewController = ViewControllers.cameraViewController() as UINavigationController
        self.navigationController!.presentViewController(cameraViewController, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
