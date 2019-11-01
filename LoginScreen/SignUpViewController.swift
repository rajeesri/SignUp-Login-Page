//
//  SignUpViewController.swift
//  LoginScreen
//
//  Created by YaathmiAR on 10/16/19.
//  Copyright © 2019 YaathmiAR. All rights reserved.
//

import UIKit
import CoreData



class SignUpViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setBackground(){
        let topColor = UIColor(red: (239.0/255.0), green: (83.0/255.0), blue:(80.0/255.0), alpha: 1)//239, 83, 80
        let bottomColor = UIColor(red: (236.0/255.0), green: (64.0/255.0), blue:(122.0/255.0), alpha: 1)//236, 64, 122
        
        self.view.applyGradient(colours:[topColor,bottomColor])
        
        
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        
        guard let username = userNameTextField.text, !username.isEmpty else {
            print("user name is empty")
            return

        }
        
        
        guard  let password = passwordTextField.text , !password.isEmpty else {
            print("user name is empty")
            return

        }
        guard  let emailId = emailIdTextField.text , !emailId.isEmpty else {
            print("emailId is empty")
            return
            
        }

        print("username = \(username), password = \(password) ")
        
        savingData(username: username, password: password, emailId: emailId)

    }
    func savingData(username : String , password : String , emailId : String ){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext//NSManagedObjectContex

        
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as NSManagedObject
        
        newUser.setValue(username, forKey: "userName")
        newUser.setValue(password, forKey: "password")
        newUser.setValue(emailId, forKey: "emailId")
        
        do {
            try context.save()
            
            print("successfully saved")
        }
        catch{
            fatalError("Failure to save context: \(error)")
        }
        
        
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
