//
//  Brain.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import UIKit
protocol ManagerDelegate{
    func didUpdateList(_ manager: AppManager, details: Details)
    func didFailedWithError(error: Error)
}

class AppManager {
    
    var listArray: [DataModel] = []
    var delegate: ManagerDelegate?
    let urlString = "https://api.github.com/repos/lexrus/LTMorphingLabel/pulls?state=closed"
    
    func performRequest(completed: @escaping ()->()){
        guard let url = URL(string: urlString)else {
            completed()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    self.listArray = try decoder.decode([DataModel].self, from: data!)
                    

                }
                catch {
                    print("at json \(error)")
        //            delegate?.didFailedWithError(error: error)
                    
                }
            completed()
//                if let safeData = data{
//                    if let details = self.parseJSON(safeData){
//                        self.delegate?.didUpdateList(self, details: details)
//                    }
                   
                }
        task.resume()
            }
            
            
        }
    
//  func parseJSON(_ listData: Data) -> Details?{
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode([DataModel].self, from: listData)
//            print(decodedData)
//
//        }
//        catch {
//            print("at json \(error)")
////            delegate?.didFailedWithError(error: error)
//
//        }
//    }
//
//}

