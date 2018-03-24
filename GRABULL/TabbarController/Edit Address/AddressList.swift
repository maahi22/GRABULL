//
//  AddressList.swift
//  GRABULL
//
//  Created by Apple on 22/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class AddressList: UIViewController {

    
    
    @IBOutlet weak var barButtonAdd: UIBarButtonItem!
    @IBOutlet weak var addListCollView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    
    
    @IBAction func AddNewAddress(_ sender: Any) {
        
        let mainStoryBoard = UIStoryboard(name: "EditAddress", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "EditAddress") as! EditAddress
        viewController.editStatus = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}





extension AddressList:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: self.addListCollView.bounds.width, height: 5.0)

    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
          return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell:DeliveryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeliveryCell", for: indexPath) as! DeliveryCell
            cell.txtViewAddress.text = "1960 W CHELSEA AVE STE 2006R\nALLENTOWN\nPennsylvania\n18104"
            return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionCellSize = collectionView.frame.size.width - padding
        var height = collectionView.frame.size.height
         height = 160.0
        return CGSize(width: collectionCellSize, height: height)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryBoard = UIStoryboard(name: "EditAddress", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "EditAddress") as! EditAddress
        viewController.editStatus = true
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}





