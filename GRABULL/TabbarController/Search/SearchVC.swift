//
//  SearchVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    lazy var searchBar = UISearchBar(frame: CGRect.zero)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.placeholder = "Enter Zip Code/city.."
        self.navigationItem.titleView = searchBar
        
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


extension SearchVC: UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       // searchBar.resignFirstResponder()
       
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
       // searchBar.resignFirstResponder()
       
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // shouldShowSearchResults = false
        // tblSearchResults.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        /*if !shouldShowSearchResults {
         shouldShowSearchResults = true
         tblSearchResults.reloadData()
         }*/
        
        searchBar.resignFirstResponder()
        
        
        
    }
}

