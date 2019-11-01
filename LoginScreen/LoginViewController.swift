//
//  ViewController.swift
//  LoginScreen
//
//  Created by YaathmiAR on 10/14/19.
//  Copyright © 2019 YaathmiAR. All rights reserved.
//

import UIKit

import  CoreData

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setBackground()
        
        //        self.btn.applyGradient(colours: [.yellow, .blue])

        // Do any additional setup after loading the view, typically from a nib.
    }

    func setBackground(){
        let topColor = UIColor(red: (239.0/255.0), green: (83.0/255.0), blue:(80.0/255.0), alpha: 1)//239, 83, 80
        let bottomColor = UIColor(red: (236.0/255.0), green: (64.0/255.0), blue:(122.0/255.0), alpha: 1)//236, 64, 122
        
        self.view.applyGradient(colours:[topColor,bottomColor])
        

    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
      
        print("loginButtonTapped ")
        guard let username = userNameTextField.text , !username.isEmpty else{
            
            print("user name is empty")
            alert(title:"Alert",messageStr: "User Name is Empty")
             return
            
        }
        guard let password = passwordTextField.text , !password.isEmpty else{
            
            alert(title:"Alert" , messageStr: "password is Empty")
            return
        }

        print("username = \(username), password = \(password) ")
 
        
        
         fetchResult(username: username, password: password)

    }
    
    func fetchResult (username : String , password :String ) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.predicate = NSPredicate(format: "userName = %@ ", username)//AND password = %@

        do
        {
            let results = try context.fetch(request)
            if results.count > 0
            {
                let result  = results.first as! NSManagedObject
                
                print("res\(result)")

                if  username ==  result.value(forKey: "userName") as! String && result.value(forKey: "password") as! String == password
                {
                
                    loggedIn()
                    

   // Entered Username & password matched
                }
                else
                {
                    alert(title:"Alert" , messageStr: "Incorrect username or password ")
                }

            }
            else{
                alert(title:"Alert" , messageStr: "Incorrect username or password ")

            }
        }catch {
            print("error during fetch \(error.localizedDescription)")

        }


    }
    
    func loggedIn(){
        
       /* let alertController = UIAlertController(title: "Hi", message: "Login Succesfully", preferredStyle:UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (alertAction) in
        }))
        self.present(alertController, animated: true, completion: nil)
*/
        self.performSegue(withIdentifier: "WelcomePage", sender: self)

    
        
        
    }
    func alert(title: String , messageStr :String){
        
        
        let alertController = UIAlertController(title: title, message: messageStr, preferredStyle:UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        
        
        print("signUpButtonTapped ")
        performSegue(withIdentifier: "SignUp", sender: nil)
        
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
        //        self.btn.applyGradient(colours: [.yellow, .blue])

}
}



extension LoginViewController : UITextFieldDelegate{
    
    
    
    
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}


