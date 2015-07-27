//
//  PhotoPostViewController.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 7/25/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class PhotoPostViewController: BaseViewController {
    
    var photo: UIImage!
    
    @IBOutlet weak var previewImage: UIImageView!
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            previewImage.image = photo
    }
    
    
    @IBAction func postPhotoButtonPressed(sender: UIButton) {
        println("The photo post button was pressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
