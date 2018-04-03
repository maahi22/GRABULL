//
//  MyProfileVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit
import MessageUI


class MyProfileVC: UIViewController {

    @IBOutlet weak var addressCollView: UICollectionView!
    
    var settingsArray = [["icon":"showProfile","segu":"toAboutstrataspot","text":"About Us"],["icon":"EditCompanyInformation","segu":"toEditCompanyInformation","text":"Help & Support"],
                         ["icon":"EditClientInformation","segu":"toEditClientInformation","text":"Feedback"] , ["icon":"showProfile","segu":"toPostFeedback","text":"Profile"], ["icon":"showProfile","segu":"toMailSettings","text":"Change Password"],["icon":"showProfile","segu":"toRouteenInspectonSettings","text":"Share"],["icon":"showAddress","segu":"toAddress","text":"Add Address"]]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
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

    
    
    @IBAction func logoutApp(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Logout!", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        self.present(alertController, animated: true, completion: nil)//Are you sure you want to logout?
        
        let yesAction:UIAlertAction  = (UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            
            
            DefaultDataManager.deleteUserId()
            
            let mainStoryBoard = UIStoryboard(name: "Login", bundle: nil)
            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            let navController = UINavigationController(rootViewController: ViewController)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = navController
            
        }))
        alertController.addAction(yesAction)
        
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
            alertController .dismiss(animated: true, completion: nil)
        }))
        
    }
    
    
    
    
    
    
    @IBAction func EditInfo(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "EditInfo", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "EditInfoVC") as! EditInfoVC
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func changePassword(_ sender: Any) {
       
        let mainStoryBoard = UIStoryboard(name: "ChangePassword", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.navigationController?.pushViewController(viewController, animated: true)
    
    }
    
    
    @IBAction func AddNewAddress(_ sender: Any) {
    }
    
    
}

/*
extension MyProfileVC : UITableViewDelegate, UITableViewDataSource,MFMailComposeViewControllerDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 2.0
        }else{
            
            return 20.0
        }
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return settingsArray.count
        }else{
            return 1;
        }
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
        if indexPath.section == 0 {
            let dic = settingsArray[indexPath.row]
            cell.textLabel?.text = dic["text"]
        }else{
            cell.textLabel?.text = "Logout"
            cell.textLabel?.textAlignment = .center
        }
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {

            if indexPath.row == 0 {
                let mainStoryBoard = UIStoryboard(name: "AboutUs", bundle: nil)
                let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "AboutUsVC") as! AboutUsVC
                self.navigationController?.pushViewController(ViewController, animated: true)
            }
           else if indexPath.row == 5 { //share
            
                let shareLink = "share url"
                let shareItems:Array = [shareLink] as [Any]
                let activityVC = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
                self.present(activityVC, animated: true, completion: nil)
                
            }
            else if indexPath.row == 6 {
                let mainStoryBoard = UIStoryboard(name: "ChangePasswordVC", bundle: nil)
                let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "AddressList") as! AddressList
                self.navigationController?.pushViewController(viewController, animated: true)
            }
            
            else{
           
                self.sendFeedback()
       
            }
        
        }else{
            self.logoutApp(self)
        }
    }
    
    
    func sendFeedback(){
        
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            // Configure the fields of the interface.
            composeVC.setToRecipients([""])
            composeVC.setSubject("FeedBack")
            composeVC.setMessageBody("", isHTML: false)
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
            
        }else{
            
            let alert = UIAlertController(title: "Alert", message: "Please configure mail", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            print("Mail services are not available")
            return
            
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // print(error)
        controller.dismiss(animated: true, completion: nil)
    }
    
}
*/


extension MyProfileVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: self.addressCollView.bounds.width, height: 5.0)
        
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
    
    
   /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mainStoryBoard = UIStoryboard(name: "EditAddress", bundle: nil)
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "EditAddress") as! EditAddress
        viewController.editStatus = true
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }*/
    
}

