//
//  ViewController.swift
//  UngService24Jan19
//
//  Created by MasterUNG on 24/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user: String?
    var password: String?
    
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }   // Main Method
    
    func checkSpace(user: String, password: String) -> Bool {
        var result: Bool?
        
        if (user.count == 0) || (password.count == 0) {
            result = true
        }else {
            result = false
        }
        return result!
    }
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        user = userTextField.text
        password = passwordTextField.text
        
        if checkSpace(user: user!, password: password!) {
            print("Have Space")
        }else {
            print("No Space")
        }
        
    }
    

}

