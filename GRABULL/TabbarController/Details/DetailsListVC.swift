//
//  DetailsListVC.swift
//  GRABULL
//
//  Created by Maahi on 02/04/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit


private let reuseCollIdentifier =  "DetailCollCell"



class DetailsListVC: UIViewController {

    
    @IBOutlet weak var detailListCollView: UICollectionView!
    var titleStr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = titleStr
        // Do any additional setup after loading the view.
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


extension DetailsListVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
        
        let cell:DetailCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCollIdentifier, for: indexPath) as! DetailCollCell
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 1
        let collectionCellSize = collectionView.frame.size.width - padding
        var height = collectionView.frame.size.height
        height = 140.0
        return CGSize(width: collectionCellSize, height: height)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}


