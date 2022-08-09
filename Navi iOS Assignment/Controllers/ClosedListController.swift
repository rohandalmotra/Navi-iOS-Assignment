//
//  ViewController.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.
//

import UIKit

class ClosedListController: UITableViewController{
    
    var number = 0
    let manager = Manager()

    override func viewDidLoad() {
//        manager.delegate = self
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
    }
    
    
 //MARK:- TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "closedRequestItemCell", for: indexPath)
        cell.textLabel?.text = manager.listArray[indexPath.row].user.login
        manager.performRequest(indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToInfoScreen", sender: self)
        
    }
    
//
//    func didUpdateList(detailedData: DetailedData) {
//        number = detailedData.numberOfRows
//        print(number)
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToInfoScreen"{
                
                
                
            }
        }

    func didFailedWithError(error: Error) {
        print(error)
    }
    
   
    
}

