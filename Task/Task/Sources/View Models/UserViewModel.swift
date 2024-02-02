//
//  UserViewModel.swift
//  Task
//
//  Created by Mohanraj T on 01/02/24.
//

import Foundation

class UserViewModel {
    var users = [User]()
    let urlString = "https://gorest.co.in/public/v2/users"

    func getUserlist(completion:@escaping () -> Void) {
        
        NetworkManager.fetchUserList(urlString: urlString) { users, error in
            if let users = users {
                self.users = users
                completion()
            }
        }
    }
    
    func createUser(user: User, completion:@escaping () -> Void) {
        NetworkManager.addUser(urlString: urlString, user: user) { error in
            if error == nil {
               completion()
            }
        }
    }
}
