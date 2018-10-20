//
//  ViewController.swift
//  ToDoey
//
//  Created by Hisham Samir on 10/15/18.
//  Copyright © 2018 Hisham Samir. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["find path", "Start over", "the finale"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Tableview Data source Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    // MARK - table view delegate
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("pressed \(itemArray[indexPath.row])")

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
                tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Items", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action)   in
            // what happened when you press Add Item
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
            print(self.itemArray)
        }
        alert.addTextField { (alertTextField)  in
            alertTextField.placeholder = "create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
    
        
    }
    
    
    
}

