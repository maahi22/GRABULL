//
//  CartVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit


private let reuseCartCell = "CartCell"

class CartVC: UIViewController {

    
    
    
    let kHeaderSectionTag: Int = 6900;
    var expandedSectionHeaderNumber: Int = -1
    var expandedSectionHeader: UITableViewHeaderFooterView!
    
    var sectionItems: Array<Any> = []
    var sectionNames: Array<Any> = []
    
    @IBOutlet weak var cartTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sectionNames = [ "Soup & Thupka", "Snaks","Brekfast", "Lunch", "Dinner" ];
        sectionItems = [ ["iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 7", "iPhone 7 Plus"],
                         ["iPad Mini", "iPad Air 2", "iPad Pro", "iPad Pro 9.7"],
                         ["Apple Watch", "Apple Watch 2", "Apple Watch 2 (Nike)"],
                         ["Apple Watch", "Apple Watch 2", "Apple Watch 2 (Nike)"],
                         ["Apple Watch", "Apple Watch 2", "Apple Watch 2 (Nike)"]];
        self.cartTableView!.tableFooterView = UIView()
        
        
        
        
        
        
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
    
    
    
    @IBAction func clickCheckOut(_ sender: Any) {
    
        
        let userId = DefaultDataManager.getUserId()
        if userId == "" {
            let mainStoryBoard = UIStoryboard(name: "Login", bundle: nil)
            let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
           // let navController = UINavigationController(rootViewController: viewController)
           // viewController.navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
            viewController.modalPresentationStyle = .overCurrentContext
            DispatchQueue.main.async(execute: {  () -> Void  in
                
                
                let navController = UINavigationController(rootViewController: viewController)
                self.present(navController, animated: true) {
                    
                }
                
               /* guard !Bundle.main.bundlePath.hasSuffix(".appex") else {
                    return; // skip operation when embedded to App Extension
                }
                
                if let delegate = UIApplication.shared.delegate {
                    delegate.window!!.rootViewController?.present(viewController, animated: true, completion: { () -> Void in
                        // optional completion code
                    })
                }*/
            })
            
            
        }else{
            let mainStoryBoard = UIStoryboard(name: "CheckOut", bundle: nil)
            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "CheckOutVC") as! CheckOutVC
            //let navController = UINavigationController(rootViewController: ViewController)
            self.navigationController?.pushViewController(ViewController, animated: true)
            /*self.present(navController, animated: true) {
             
             }*/
        }
        
    }
    
    
}


extension CartVC:UITableViewDelegate,UITableViewDataSource{
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if(velocity.y>0) {
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
              //  self.navigationController?.setToolbarHidden(true, animated: true)
                print("Hide")
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
             //   self.navigationController?.setToolbarHidden(false, animated: true)
                print("Unhide")
            }, completion: nil)
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sectionNames.count > 0 {
            tableView.backgroundView = nil
            return sectionNames.count
        } else {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "Retrieving data.\nPlease wait."
            messageLabel.numberOfLines = 0;
            messageLabel.textAlignment = .center;
            messageLabel.font = UIFont(name: "HelveticaNeue", size: 20.0)!
            messageLabel.sizeToFit()
            self.cartTableView.backgroundView = messageLabel;
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.sectionNames.count != 0) {
            return self.sectionNames[section] as? String
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //recast your view as a UITableViewHeaderFooterView
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        //header.contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "#408000")
        header.textLabel?.textColor = UIColor.black
        
        if let viewWithTag = self.view.viewWithTag(kHeaderSectionTag + section) {
            viewWithTag.removeFromSuperview()
        }
        let headerFrame = self.view.frame.size
        let theImageView = UIImageView(frame: CGRect(x: headerFrame.width - 32, y: 31, width: 18, height: 18));
        theImageView.image = UIImage(named: "openSection")?.withRenderingMode(.alwaysTemplate)
        theImageView.tintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
        theImageView.tag = kHeaderSectionTag + section
        header.addSubview(theImageView)
        
        // make headers touchable
        header.tag = section
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(CartVC.sectionHeaderWasTouched(_:)))
        header.addGestureRecognizer(headerTapGesture)
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Expand / Collapse Methods
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! UITableViewHeaderFooterView
        let section    = headerView.tag
        let eImageView = headerView.viewWithTag(kHeaderSectionTag + section) as? UIImageView
        
        if (self.expandedSectionHeaderNumber == -1) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section, imageView: eImageView!)
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section, imageView: eImageView!)
            } else {
                let cImageView = self.view.viewWithTag(kHeaderSectionTag + self.expandedSectionHeaderNumber) as? UIImageView
                tableViewCollapeSection(self.expandedSectionHeaderNumber, imageView: cImageView!)
                tableViewExpandSection(section, imageView: eImageView!)
            }
        }
    }
    
    func tableViewCollapeSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section] as! NSArray
        
        self.expandedSectionHeaderNumber = -1;
        if (sectionData.count == 0) {
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.cartTableView!.beginUpdates()
            self.cartTableView!.deleteRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            self.cartTableView!.endUpdates()
        }
    }
    
    func tableViewExpandSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section] as! NSArray
        
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1;
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.expandedSectionHeaderNumber = section
            self.cartTableView!.beginUpdates()
            self.cartTableView!.insertRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            self.cartTableView!.endUpdates()
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: footerView.frame.height, width: tableView.frame.width - tableView.separatorInset.right, height: 1))
        separatorView.backgroundColor = UIColor.lightGray
        footerView.addSubview(separatorView)
        return footerView
    }
    
    
    
    
    
    
    
    
    
    
    /*func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
        
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DeviceType.IS_IPHONE_6P {
            return 105.0
        }else{
            return 90.0
        }
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.expandedSectionHeaderNumber == section) {
            let arrayOfItems = self.sectionItems[section] as! NSArray
            return arrayOfItems.count;
        } else {
            return 0;
        }
        
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CartCell = tableView.dequeueReusableCell(withIdentifier: reuseCartCell, for: indexPath) as! CartCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
}


