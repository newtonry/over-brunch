//
//  CCClient.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 6/27/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

//let BASE_URL = "http://over-brunch-mock-api-d.elasticbeanstalk.com/"
let BASE_URL = "http://localhost:4567/"
let LOOKS_ENDPOINT = "looks/"


class CCClient: BDBOAuth1RequestOperationManager {
    // TODO make this a singleton?

    class var sharedInstance: CCClient {
        struct Static {
            static let instance = CCClient()
        }
        
        return Static.instance
    }
    
    func getLooks(callback: (response: NSArray) -> Void) {
        let url = "\(BASE_URL)\(LOOKS_ENDPOINT)"
        let params = NSDictionary()
        
        GET(url, parameters: params, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            callback(response: response as NSArray)
            },
            failure: nil
        )
    }
    
    func postLook() {
        let url = "\(BASE_URL)\(LOOKS_ENDPOINT)"
        let params = ["test": "A test message"]
        POST(url, parameters: params, success: nil, failure: nil)
    }
}
