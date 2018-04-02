//
//  SearchVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit


private let reuseCartCell = "SearchCell"

class SearchVC: UIViewController {

    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    var locationManager = LocationManager.sharedInstance
    var latitude :Double = 0.0
    var longitude :Double = 0.0
    
    @IBOutlet weak var tblViewSearch: UITableView!
    var searchItems: Array<Any> = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchItems = [ "North Indian", "Chinese","Snaks", "Wraps", "Kebab", "Biryani","Sandwiches", "Italian", "Chily potato"  ];
        
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

    
    
    
    
    func callSearchApi()  {
        
        let token = DefaultDataManager.getDeviceToken()
        let urlString = baseUrl + Api_Login
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let paramString = ["DeviceId":deviceID,"latitude":self.latitude,"longitude":self.longitude] as [String : Any]
        
        /*ConnectionHelper.KSCgetDataFromJson(url: urlString, paramString: paramString) { (responce, status) in
            
            
            
            
        }*/
   
    }
    
    
    
    
    
    
    
    
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
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        /*if !shouldShowSearchResults {
         shouldShowSearchResults = true
         tblSearchResults.reloadData()
         }*/
        
        if searchBar.text == "" {
            searchBar.resignFirstResponder()
            return
        }
        
        if  let str:String =  searchBar.text {
            locationManager.geocodeUsingGoogleAddressString(address:str as NSString) { (dict, placemark, add) in
                
                
                //print(dict , placemark)
                if let locDict = dict {
                    
                    guard let lat:String = locDict.value(forKey: "latitude") as? String else {return}
                    guard let lang:String = locDict.value(forKey: "longitude") as? String else {return}
                    
                    
                    self.latitude =  Double(lat)!
                    self.longitude = Double(lang)!
                }
                
                self.callSearchApi()
                print(self.latitude , self.longitude)
            }
        }
        
        
        
        
        searchBar.resignFirstResponder()
        
        
        
    }
}


extension SearchVC:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DeviceType.IS_IPHONE_6P {
            return 75.0
        }else{
            return 70.0
        }
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return searchItems.count;
       
        
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseCartCell, for: indexPath) //as! UITableViewCell
        cell.textLabel?.text = searchItems[indexPath.row] as! String
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainStoryBoard = UIStoryboard(name: "DetailList", bundle: nil)
        let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailsListVC") as! DetailsListVC
        self.navigationController?.pushViewController(ViewController, animated: true)
        
    }
    
    
}
