//
//  Brain.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import UIKit
protocol ManagerDelegate{
    func didUpdateList(list: DataModel)
    func didFailedWithError(error: Error)
}



class Manager {
    var listArray: [DataModel] = []
    let urlAPI = "https://api.github.com/repos/lexrus/LTMorphingLabel/pulls?state=closed"
    var delegate: ManagerDelegate?
    func performRequest(){
        if let url = URL(string: urlAPI){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                if let safeData = data{
//                    print(safeData)
                    self.parseJSON(safeData)
//                    if let listData =  parseJSON(safeData){
//                        delegate?.didUpdateList(list: listData)
//                    }
                    
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ listData: Data){
        let decoder = JSONDecoder()
        do {
            self.listArray = try decoder.decode([DataModel].self, from: listData)
            
            print(listArray[0].title)
            
        }
        catch {
            print("at json \(error)")
//            delegate?.didFailedWithError(error: error)
            
        }
    }
}

