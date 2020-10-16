//
//  Services.swift
//  WMTrading
//
//  Created by Panupong Chaiyarut on 10/8/2563 BE.
//  Copyright © 2563 Panupong Chaiyarut. All rights reserved.
//
import Foundation
class Services {
    func getPosts(completion: @escaping ([Post]?) -> ()) {
        
        guard let url = URL(string: "https://enet5-7f9f6.firebaseio.com/movies.json") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }.resume()
        
    }
}
