//
//  RegisterViewController.swift
//  UngService24Jan19
//
//  Created by MasterUNG on 24/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    Explicit
    var name: String?
    var user: String?
    var password: String?
    
    
    
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }   // Main Method
    
    func uploadToServer(name: String, user: String, password: String) -> Void {
        let myConstant = MyConstant()
        let urlPHP: String = myConstant.findURLaddUser(name: name, user: user, password: password)
        print("urlPHP ==> \(urlPHP)")
        
//        upload Process
        let url = URL(string: urlPHP)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if error != nil {
                print("Have Error")
            } else {
                
//                Receive data
                if let testData = data {
                    
                    let canReadData = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadData ==> \(String(describing: canReadData))")
                    
                    let myResponse: String = canReadData! as String
                    if Bool(myResponse)! {
                        print("Success Upload")
                        
//                        Process Pop
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "BackMain", sender: self)
                        }
                        
                    } else {
                        print("Cannot Upload")
                    }
                    
                    
                }
            }
            
        } // End Task
        task.resume()
        
        
        
        
    }
    
    func showAlert(title: String, message: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(objAlert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
//        Get Value From TextField
        name = nameTextField.text
        user = userTextField.text
        password = passwordTextField.text
        
//        Show Log
        print("name ==> \(String(describing: name))")
        print("user ==> \(String(describing: user))")
        print("password ==> \(String(describing: password))")
        
//        Check Space
        if (name!.count == 0) || (user!.count == 0) || (password!.count == 0) {
//            Have Space
            print("Have Space")
             showAlert(title: "Have Space", message: "Please Fill All Every Blank")
        } else {
            print("No Space")
            uploadToServer(name: name!, user: user!, password: password!)
        }
        
        
    }   // uploadButton
    
}   // Main Class
