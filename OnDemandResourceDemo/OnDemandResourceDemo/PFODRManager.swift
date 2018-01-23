//
//  PFODRManager.swift
//  OnDemandResourceDemo
//
//  Created by Sagar More on 22/01/18.
//  Copyright © 2018 Sagar More. All rights reserved.
//

import UIKit

class PFODRManager  {
   
    static let sharedManager = PFODRManager()
    var currentRequest : NSBundleResourceRequest?
    
    
    /**
     This method downloads resources with given tags.
    */
    func requestResourceWith (tag: Set <String> ,
                              onSuccess: @escaping () -> Void,
                              onError: @escaping (NSError) -> Void )  {
        currentRequest = NSBundleResourceRequest(tags: tag)
        
        guard let request = currentRequest else {
            return
        }
        
        request.beginAccessingResources { (error) in
            if let err = error {
              
                onError(err as NSError)
                return
            }
            onSuccess()
        }
    }
    
    
    /**
     This method purge/remove resources if required.
     By default iOS system removes the on demand-resources on disk full.
     */
    func purgeResource() {
        guard let request = currentRequest else {
            return
        }
        
        request.endAccessingResources()
    }
    
}
