//
//  Look.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 6/28/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

class Look: NSObject {
   
    let id: NSInteger
    let imageUrl: NSURL
    
    init(id: NSInteger, imageUrl: NSURL) {
        self.id = id
        self.imageUrl = imageUrl
    }
    
    convenience init(jsonLook: NSDictionary) {
        // TODO should add some non-assuming checks in here
        let id = jsonLook["id"] as NSInteger
        let imageUrlString = jsonLook["image_url"] as String
        let imageUrl = NSURL(string: imageUrlString)
        self.init(id: id, imageUrl: imageUrl!)
    }
    
    class func looksFromJson(jsonLooks: NSArray) -> [Look]{
        var looks: [Look] = []
        
        for jsonLook in jsonLooks {
            if let jsnLk = jsonLook as? NSDictionary {
                let look = Look(jsonLook: jsnLk)
                looks.append(look)
            } else {
                println("The look was not a dictionary!")
            }
        }
        
        return looks
    }
}
