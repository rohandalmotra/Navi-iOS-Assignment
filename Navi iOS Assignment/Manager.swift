//
//  Brain.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import UIKit
//protocol ManagerDelegate{
//    func didUpdateList(detailedData: DetailedData)
//    func didFailedWithError(error: Error)
//}



class Manager {
    var listArray: [DataModel] = []
    let urlAPI = "https://api.github.com/repos/lexrus/LTMorphingLabel/pulls?state=closed"
//    var delegate: ManagerDelegate?
    var numberOfRows = 0
    var title = ""
    var userName = ""
    var userImage = ""
    var createdDate = ""
    var closedDate = ""
    
    
    func performRequest(_ listNumber: Int){
        if let url = URL(string: urlAPI){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { [self] data, response, error in
//                if error != nil {
//                    self.delegate?.didFailedWithError(error: error!)
//                    return
//                }
                if let safeData = data{
//                    print(safeData)

                    if let listData =  self.parseJSON(safeData, listNumber){
//                        self.delegate?.didUpdateList(detailedData: listData)
                    }
                    
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ listData: Data, _ listNumber: Int){
        let decoder = JSONDecoder()
        do {
            self.listArray = try decoder.decode([DataModel].self, from: listData)
           numberOfRows = listArray.count
            title = listArray[listNumber].title
            userName = listArray[listNumber].user.login
            userImage = listArray[listNumber].user.avatar_url
            createdDate = listArray[listNumber].created_at
            closedDate = listArray[listNumber].closed_at
//            let allData = DetailedData(title: title, userName: userName, userImage: userImage, closedDate: closedDate, createdDate: createdDate, numberOfRows: numberOfRows)
//            return allData
        }
        catch {
            print("at json \(error)")
//            delegate?.didFailedWithError(error: error)
//            return nil
        }
        
    }
    
    func getNumberOfRows() -> Int{
        return listArray.count
    }
    
    
    
}

