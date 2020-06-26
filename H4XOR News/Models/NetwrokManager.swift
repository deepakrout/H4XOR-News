//
//  NetwrokManager.swift
//  H4XOR News
//
//  Created by Deepak Rout on 6/24/20.
//  Copyright © 2020 Deepak Rout. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData()  {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            _ = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            print("Result form the call \(results)")
                            DispatchQueue.main.async {
                                self.posts = results.hits
                                
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                    
                }
            }.resume()
            
        }
    }
}
