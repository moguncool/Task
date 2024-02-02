//
//  NetworkManager.swift
//  Task
//
//  Created by Mohanraj T on 01/02/24.
//

import Foundation

class NetworkManager {
    class func fetchUserList(urlString: String, completion:@escaping ([User]?, String?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.addValue("Bearer f9301ab794337a8c3ce41c2ec045b1e74ab8ef661e7a5535eb167343fe94f775", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let dataModel = try? JSONDecoder().decode([User].self, from: data)
                completion(dataModel, nil)
            } else {
                completion(nil, "error")
            }
        }
        task.resume()
    }
    
    class func addUser(urlString: String, user: User, completion:@escaping (String?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let data = try! JSONEncoder().encode(user)
        var request = URLRequest(url: url)
        request.httpBody = data
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.addValue(
            "Bearer f9301ab794337a8c3ce41c2ec045b1e74ab8ef661e7a5535eb167343fe94f775",
            forHTTPHeaderField: "Authorization"
        )
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                completion(nil)
            }
        }
        task.resume()
    }
}
