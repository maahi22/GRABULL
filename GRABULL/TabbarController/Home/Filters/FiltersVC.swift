//
//  FiltersVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

protocol FiltersDelegate {
    
    //func filterChanges(_ filterArray : [Filter])
   // func distanceChanges(_ distance : Double)
}

class FiltersVC: UIViewController {

    
     var delegate:FiltersDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Filters"
        
        
        
        
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
    
    
    
    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated: true) {
            
        }
        
    }
    
    
    

}
