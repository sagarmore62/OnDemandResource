//
//  NextViewController.swift
//  OnDemandResourceDemo
//
//  Created by Sagar More on 22/01/18.
//  Copyright © 2018 Sagar More. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imgBackground : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getRequiredResourceForScreen()
    }
    
    func getRequiredResourceForScreen() {
        let imgName = "Screen2"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
