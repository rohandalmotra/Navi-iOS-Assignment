//
//  Brain.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import UIKit
class AppManager {
    
    var listArray: [DataModel] = []
    
//     api syntax = "https://api.github.com/repos/{owner}/{repo}/pulls"
    
    let urlString = "https://api.github.com/repos/lexrus/LTMorphingLabel/pulls?state=closed"
    
    func performRequest(completed: @escaping ()->()){
        guard let url = URL(string: urlString)else {
            completed()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error caught at url session\(error!)")
                return
            }
            do {
                let decoder = JSONDecoder()
                self.listArray = try decoder.decode([DataModel].self, from: data!)
                
                }
            catch {
            print("Error caught at parsingJSON\(error)")
                
            }
            completed()
        }
        task.resume()
    }
    
    
}


