//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by YaathmiAR on 10/30/19.
//  Copyright © 2019 YaathmiAR. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view.
    }
    func setBackground(){
        let topColor = UIColor(red: (239.0/255.0), green: (83.0/255.0), blue:(80.0/255.0), alpha: 1)//239, 83, 80
        let bottomColor = UIColor(red: (236.0/255.0), green: (64.0/255.0), blue:(122.0/255.0), alpha: 1)//236, 64, 122
        
        self.view.applyGradient(colours:[topColor,bottomColor])
        
        
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
