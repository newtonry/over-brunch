//
//  LooksListingViewController.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 3/30/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class LooksListingViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, LookVotingTableViewCellDelegate {

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
        let cell = tableView.dequeueReusableCellWithIdentifier("lookCell") as LookVotingTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    @IBAction func cameraButtonPressed(sender: UIBarButtonItem) {
        let cameraViewController = ViewControllers.cameraViewController() as UINavigationController
        self.navigationController!.presentViewController(cameraViewController, animated: true, completion: nil)
        
    }

    func onVoteSliderSlid(cellSlid: UITableViewCell, voteValue: Float) {
        let indexPath: NSIndexPath = looksTableView.indexPathForCell(cellSlid)!
        let newIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
        // TODO need to handle the case that there are no more cells
        looksTableView.scrollToRowAtIndexPath(newIndexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        
        println("The voted value was \(voteValue)")
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
