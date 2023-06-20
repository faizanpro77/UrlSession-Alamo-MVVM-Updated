//
//  UserModel.swift
//  UrlSession+Alamo+MVVM+Updated
//
//  Created by MD Faizan on 17/06/23.
//

import UIKit
import Foundation

/**
 "userId": 1,
 "id": 1,
 "title": "delectus aut autem",
 "completed": false
 
 */


struct UserModel:Codable {
    
    let userId:Int?
    let id: Int?
    let title: String?
    let completed: Bool?
    
    
    func getStatusColour() -> (String,UIColor) {
        if completed ?? true {
            
            return ("Completed",UIColor.blue)
        }else{
            return ("Note Completed",UIColor.red)
        }
        
    }
    
}



