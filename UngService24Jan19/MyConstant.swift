//
//  MyConstant.swift
//  UngService24Jan19
//
//  Created by MasterUNG on 25/1/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import Foundation

class MyConstant {
    
    
    
    func findJSONwhereUser(user: String) -> String {
        let result = "https://www.androidthai.in.th/hit/getUserWhereUserMaster24Jan.php?isAdd=true&User=\(user)"
        return result
    }
    
    func findURLaddUser(name: String, user: String, password: String) -> String {
        let result = "https://www.androidthai.in.th/hit/addUserMaster24Jan.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        return result
    }
    
    
}   // MyConstant Class


