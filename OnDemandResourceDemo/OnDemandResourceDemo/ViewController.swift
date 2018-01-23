//
//  ViewController.swift
//  OnDemandResourceDemo
//
//  Created by Sagar More on 22/01/18.
//  Copyright © 2018 Sagar More. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgBackground : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getRequiredResourceForScreen()
    }
    
    func getRequiredResourceForScreen() {
        let imgName = "Screen1"
        let set : Set = Set(arrayLiteral: imgName)
        PFODRManager.sharedManager.requestResourceWith(tag: set, onSuccess: {
            DispatchQueue.main.async {
                self.imgBackground.image = UIImage.init(named: imgName)
            }
        }) { (error) in
            self.showOnDemandResourceError(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIViewController {
    func showOnDemandResourceError(_ error : NSError) {
        let controller = UIAlertController (
            title: "Error",
            message: "There was a problem.",
            preferredStyle: .alert)
        
        switch error.code {
        case NSBundleOnDemandResourceOutOfSpaceError:
            controller.message = "You don't have enough space available to download this resource."
        case NSBundleOnDemandResourceExceededMaximumSizeError:
            controller.message = "The bundle resource was too big."
        case NSBundleOnDemandResourceInvalidTagError:
            controller.message = "The requested tag does not exist."
        default:
            controller.message = error.description
        }
        
        controller.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(controller, animated: true)
        }
    }
}

