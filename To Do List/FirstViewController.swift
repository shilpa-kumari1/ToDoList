//
//  FirstViewController.swift
//  To Do List
//
//  Created by Shilpa Kumari on 05/08/19.
//  Copyright © 2019 Shilpa Kumari. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
   
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    
  
 
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        var cellLabel = ""
        if let tempLabel = items[indexPath.row] as? String{
            cellLabel = tempLabel
        }
        cell.textLabel?.text = cellLabel
        return cell
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        }
    
    override func viewDidAppear(_ animated: Bool){
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        //print(itemsObject)
        if let tempItems = itemsObject as? [String]{
            items = tempItems
            print(tempItems)
        }
        //print(items)}
       // print(items)
        table.reloadData()
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            items.remove(at: indexPath.row)
            table.reloadData()
             UserDefaults.standard.set(items, forKey: "items")
            
        }
    }
 

}

