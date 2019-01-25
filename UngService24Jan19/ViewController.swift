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
    
    func checkAuthen(user: String, password: String) -> Void {
        
        let myConstant = MyConstant()
        let urlPHP = myConstant.findJSONwhereUser(user: user)
        print("urlPHP ==> \(urlPHP)")
        
        guard let url = URL(string: urlPHP) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let dataResponse = data, error == nil else {
                print("Have Error")
                return
            }
            
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("jsonResponse ==> \(jsonResponse)")
                
            } catch let myError {
                print(myError)
                print("No \(user) in my Database")
                
                DispatchQueue.main.async {
                    self.myAlert(title: "User False", message: "No \(user) in my Database")
                }
                
            }
            
        }   // End Task
        task.resume()
        
        
        
    }
    
    func myAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
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
            myAlert(title: "Have Space", message: "Please Fill All Blank")
        }else {
            print("No Space")
            checkAuthen(user: user!, password: password!)
        }
        
    }
    

}

