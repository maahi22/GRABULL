//
//  PaymentTypeVC.swift
//  GRABULL
//
//  Created by Maahi on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class PaymentTypeVC: UIViewController {

    @IBOutlet weak var paymentTable: UITableView!
    var paymentArray = [["icon":"CreditCard","segu":"toCredit Card","text":"Credit Card"],["icon":"Debitcard","segu":"toDebitcard","text":"Debit card"], ["icon":"NetBanking","segu":"toNetBanking","text":"Net Banking"]]
    
    
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

}


extension PaymentTypeVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 2.0
        }else{
            
            return 20.0
        }
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return paymentArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        /*if indexPath.row % 2 == 0{
         cell.backgroundColor = UIColor.hexStringToUIColor(hex: stratspot_Rollover_colour_nav_colour)
         }else{
         cell.backgroundColor = UIColor.white
         }*/
        
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath )
        let dic = paymentArray[indexPath.row]
        cell.textLabel?.text = dic["text"]
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
