//
//  HomeVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit



 private let reuseCollIdentifier = "ResturentCollCell"
 private let cellIdentifier = "ResturentCell"



class HomeVC: UIViewController {

    
    @IBOutlet weak var gotoCart: UIBarButtonItem!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var listTblView: UITableView!
    
    var locationManager = LocationManager.sharedInstance
    var latitude :Double = 0.0
    var longitude :Double = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        segmentController.tintColor = .white
    
    
        //get GPS location
        locationManager.autoUpdate = true
        locationManager.startUpdatingLocationWithCompletionHandler { (lat, lang, Status, verboseMsg, error)  in
            
            DispatchQueue.main.async(execute: { [weak self] () -> Void  in
                guard let strongSelf = self else { return }
                
                strongSelf.latitude = lat
                strongSelf.longitude = lang
                
            })
            
            
        }
        
        //ENDED
        
        
    
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

    
    
   
    @IBAction func gotoCart(_ sender: Any) {
    
        let mainStoryBoard = UIStoryboard(name: "Cart", bundle: nil)
        let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        let navController = UINavigationController(rootViewController: ViewController)
        self.present(navController, animated: true) {
            
        }
    
    }
    
    
    
    @IBAction func filterBy(_ sender: Any) {
   
        let mainStoryBoard = UIStoryboard(name: "Filters", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "FiltersVC") as! FiltersVC
        let navController = UINavigationController(rootViewController: viewController)
        self.present(navController, animated: true) {
            
        }
        
       
       
        
        
        
    
    }
    
}




extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
            return 2.0
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 144.0
        
    }
    
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 10
        
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell:ResturentCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ResturentCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let mainStoryBoard = UIStoryboard(name: "MenuItems", bundle: nil)
    let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MenuItemsVC") as! MenuItemsVC
    self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
    
}


extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        
            return 10
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ResturentCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCollIdentifier, for: indexPath) as! ResturentCollCell
        
         return cell
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let padding: CGFloat = 5
            let collectionCellSize = collectionView.frame.size.width - padding
            let height = collectionView.frame.size.height - (padding * 4)
            return CGSize(width: collectionCellSize/5, height: height)
            
        
    }
    
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
    }

}


