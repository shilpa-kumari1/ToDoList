//
//  SecondViewController.swift
//  To Do List
//
//  Created by Shilpa Kumari on 05/08/19.
//  Copyright © 2019 Shilpa Kumari. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBAction func add(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        //print(itemsObject)
        var items:[String]
        
        if let tempItems = itemsObject as? [String]{
            items = tempItems
            items.append(itemTextField.text!)
            //print(items)
        }
        else{
            items = [itemTextField.text!]
        }
        //print("second \(items)")
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      

    }
}

