//
//  ViewController.swift
//  Navi iOS Assignment
//
//  Created by Rohan Dalmotra on 08/08/22.


import UIKit

class ClosedListController: UITableViewController{
    
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
        cell.detailTextLabel?.text = "From \(appManager.listArray[indexPath.row].user.login)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToInfoScreen", sender: self)
        
    }
    
    
    //MARK:- Performed Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInfoScreen"{
            let destinationVC = segue.destination as! InfoViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            let title = self.appManager.listArray[selectedIndexPath.row].title
            let userName = self.appManager.listArray[selectedIndexPath.row].user.login
            let closedDate = self.appManager.listArray[selectedIndexPath.row].closed_at
            let createdDate = self.appManager.listArray[selectedIndexPath.row].created_at
            
            DispatchQueue.main.async {
                destinationVC.titleLabel.text = title
                destinationVC.userNameLabel.text = userName
                destinationVC.closedDateLabel.text = "Closed Date: \(closedDate)"
                destinationVC.createdDateLabel.text = "Created Date: \(createdDate)"
                performRequestForImage()
                
            }
            func performRequestForImage(){
                let urlString = appManager.listArray[selectedIndexPath.row].user.avatar_url
                let url = URL(string: urlString)
                if let data = try? Data(contentsOf: url!)
                {
                    let image: UIImage = UIImage(data: data)!
                    destinationVC.userImage.image = image
                }
            }
        }
    }
}
