//
//  CheckOutVC.swift
//  GRABULL
//
//  Created by Maahi on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class CheckOutVC: UIViewController {

    @IBOutlet weak var checkOutCollView: UICollectionView!
    
    
    let sectionNames = [ "Soup & Thupka", "Snacks","Chilly Potato" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Checkout"
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

    
    
    
    @IBAction func payAmount(_ sender: Any) {
    
        let mainStoryBoard = UIStoryboard(name: "PaymentType", bundle: nil)
        let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "PaymentTypeVC") as! PaymentTypeVC
        self.navigationController?.pushViewController(ViewController, animated: true)
    
    }
    
  
    
}



extension CheckOutVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        if section == 0 {
            return CGSize(width: self.checkOutCollView.bounds.width, height: 1.0)
        }else if section == 1{
            return CGSize(width: self.checkOutCollView.bounds.width, height: 1.0)
        }else{
            
            return CGSize(width: self.checkOutCollView.bounds.width, height: 5.0)
        }
        
        
    }

    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return 3
        }else if section == 1{
            return 1
        }else{
        
        return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell:CheckoutItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CheckoutItemCell", for: indexPath) as! CheckoutItemCell
            cell.itemName.text = sectionNames[indexPath.row]
            
            return cell
        }else if indexPath.section == 1 {
            let cell:ChekoutTotalCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChekoutTotalCell", for: indexPath) as! ChekoutTotalCell
            return cell
        }else{
            let cell:DeliveryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeliveryCell", for: indexPath) as! DeliveryCell
            cell.txtViewAddress.text = "1960 W CHELSEA AVE STE 2006R\nALLENTOWN\nPennsylvania\n18104"
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
     let padding: CGFloat = 10
     let collectionCellSize = collectionView.frame.size.width - padding
        var height = collectionView.frame.size.height
        if indexPath.section == 0 {
             height = 40.0
        }else if indexPath.section == 1{ 
            height = 240.0
        }else{
            
            height = 160.0
        }
        
    
     return CGSize(width: collectionCellSize, height: height)
     
     
     }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}











