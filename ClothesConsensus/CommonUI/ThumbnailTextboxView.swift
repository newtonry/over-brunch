//
//  ThumbnailTextboxView.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 7/25/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class ThumbnailTextboxView: UIView, UITextFieldDelegate {
    
    // Got all this xib stuff from http://iphonedev.tv/blog/2014/12/15/create-an-ibdesignable-uiview-subclass-with-code-from-an-xib-file-in-xcode-6
    // May want to revisit
    
    
    @IBOutlet weak var descriptionField: UITextField!
    
    // Our custom view from the XIB file
    var view: UIView!
    var editable: Bool = true
    
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ThumbnailTextboxView", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as UIView
        return view
    }
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)

        // 3. Setup view from .xib file
        xibSetup()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
        
        descriptionField.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return editable;
    }

    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    
    
    
    

}
