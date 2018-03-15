//
//  HistoryVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.callHistoryApi()
        
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
    
    
    
    
    func callHistoryApi()  {
        
        let token = DefaultDataManager.getDeviceToken()
        let urlString = baseUrl + Api_Login
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let paramString = ["DeviceId":deviceID,"token":token] as [String : Any]
        
       /* ConnectionHelper.KSCgetDataFromJson(url: urlString, paramString: paramString) { (responce, status) in
            
            
            
            
        }*/
        
    }
    
    

}


extension HistoryVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
        
        let cell:HistoryCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCollCell", for: indexPath) as! HistoryCollCell
        
        return cell
    }
    
    
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 5
        let collectionCellSize = collectionView.frame.size.width - padding
        let height = collectionView.frame.size.height - (padding * 4)
        return CGSize(width: collectionCellSize/5, height: height)
        
        
    }*/
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}







