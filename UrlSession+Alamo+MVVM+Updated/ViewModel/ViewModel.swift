//
//  ViewModel.swift
//  UrlSession+Alamo+MVVM+Updated
//
//  Created by MD Faizan on 18/06/23.
//

import Foundation



class ViewModel {

    var reload:(()->())? = nil
    var userData = [UserModel]()
    
    func fetchDetails() {
        APIManager.shared.getAllUserData { [weak self] (users) in
//            guard let`self` = self else { return }
            if let users = users {
//                self.userData = users
                self?.userData = users
                print(users)
                
//                self.reload?()
                self?.reload?()
                
                
            }else{
                print("Somthing went wrong")
            }
        }
        
        
    }
    
}
