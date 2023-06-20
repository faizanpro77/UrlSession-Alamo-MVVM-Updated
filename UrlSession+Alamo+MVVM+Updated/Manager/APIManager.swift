//
//  APIManager.swift
//  UrlSession+Alamo+MVVM+Updated
//
//  Created by MD Faizan on 17/06/23.
//
import Foundation
import UIKit
import Alamofire
//https://jsonplaceholder.typicode.com/todos/

class APIManager {
    
   static let shared = APIManager()
    private init() {}
        
        
        
    func getAllUserData(completionHandler: @escaping (_ data:[UserModel]?) -> ()) {
        
            URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { data, response, errorr in
        
                if errorr == nil , let data = data{
        
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        completionHandler(userResponse)
//                        print(userResponse)
                    
                    }catch let err{
                        print(err.localizedDescription)
                        completionHandler(nil)
                    }
                }else{
                    print(errorr?.localizedDescription)
                    completionHandler(nil)
        
                }
            }.resume()
        }

    


//func getAllUserData() {
//
//    AF.request("https://jsonplaceholder.typicode.com/todos/").response { response in
//
//        if let data  = response.data{
//
//            do {
//                let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
//                print(userResponse)
//            }catch let err{
//                print(err.localizedDescription)
//            }
//
//
//        }
//    }
//}


}
