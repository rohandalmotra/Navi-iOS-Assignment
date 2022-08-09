//
//  ViewController.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import UIKit

class ClosedListController: UITableViewController{
    
    var number = 0
    let appManager = AppManager()

    override func viewDidLoad() {
       super.viewDidLoad()
        appManager.performRequest {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
     
    }
    
    
 //MARK:- TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appManager.listArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "closedRequestItemCell", for: indexPath)
        cell.textLabel?.text = appManager.listArray[indexPath.row].title
        return cell
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToInfoScreen", sender: self)
        
    }
    
    
   
    
}
}
