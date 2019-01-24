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
        } else {
            print("No Space")
        }
        
        
    }   // uploadButton
    
}   // Main Class
