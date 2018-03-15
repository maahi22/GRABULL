//
//  AddItemVC.swift
//  GRABULL
//
//  Created by Apple on 13/03/18.
//  Copyright © 2018 m&PTeck. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    
    
    @IBOutlet weak var btnHalfRadio: UIButton!
    @IBOutlet weak var btnFullRadio: UIButton!
    
    
    @IBOutlet weak var btnNegative: UIButton!
    @IBOutlet weak var btnPositive: UIButton!
    @IBOutlet weak var btnCount: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        view.isOpaque = false
        view.backgroundColor = .clear // try other colors, say: .white or black with Alpha etc.
    
        btnHalfRadio.tintColor = .red
        btnFullRadio.tintColor = .red
        
    
        btnNegative.roundCorners([.topLeft, .bottomLeft], radius: 4)

        btnPositive.roundCorners([.topRight, .bottomRight], radius: 4)

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
    
    
    @IBAction func cancelCart(_ sender: Any) {
        
        self.dismiss(animated: true) {
            
        }
    }
    
    
    @IBAction func radioClick(_ sender: UIButton) {
    
        let tag = sender.tag
        let btn:UIButton = sender
        let img = UIImage(named: "radioOn")?.withRenderingMode(.alwaysTemplate)
        let imgOff = UIImage(named: "radioOff")?.withRenderingMode(.alwaysTemplate)
        
        
        
       
        
        
        btn.setImage(img, for: .normal)
        btn.tintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
        
        if tag == 2{
            btnHalfRadio.setImage(imgOff, for: .normal)
            btn.tintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
        }
        
       if tag == 1 {
            btnFullRadio.setImage(imgOff, for: .normal)
            btn.tintColor = UIColor.hexStringToUIColor(hex: navigationBarColor)
        }
    
    
    }
    
    
    @IBAction func clickpositive(_ sender: Any) {
    
    
        guard let countValue = btnCount.titleLabel?.text else { return }
        if Int(countValue)! < 1 {
            return
        }else{
            
            let  val:Int = Int(countValue)!
            btnCount.setTitle("\(val + 1)", for: .normal)
            
        }
        
    }
    
    
    
    @IBAction func clickNegative(_ sender: Any) {
    
        guard let countValue = btnCount.titleLabel?.text else { return }
        
        
        if Int(countValue) == 1 {
            return
        }else{
            
            let  val:Int = Int(countValue)!
            btnCount.setTitle("\(val - 1)", for: .normal)
            
        }
    
        
        
        
    }
    
    
    
    

}
