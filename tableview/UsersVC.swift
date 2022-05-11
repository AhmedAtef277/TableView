//
//  UsersVC.swift
//  tableview
//
//  Created by mac on 08/01/2022.
//

import UIKit

class UsersVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
 
    

    @IBOutlet weak var insertField: UITextField!
    @IBOutlet weak var tableOfItems: UITableView!
    
    var arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableOfItems.delegate = self
        tableOfItems.dataSource = self
        
    }
    

    @IBAction func editBtn(_ sender: Any) {
        tableOfItems.isEditing =
        !tableOfItems.isEditing
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        if insertField.text == "" {
            return
        }
        if let text = insertField.text{
            arr.append(text)
            let index = IndexPath(row: arr.count - 1, section: 0)
            tableOfItems.beginUpdates()
            tableOfItems.insertRows(at: [index], with: .automatic)
            tableOfItems.endUpdates()
            insertField.text = ""
                
        }
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arr.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .destructive, title: "") { _, _, _ in
            self.arr.remove(at: indexPath.row)
            self.tableOfItems.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
        }
        let added = UIContextualAction(style: .normal, title: "") { _, _, _ in
            
        }
        let addToFav = UIContextualAction(style: .normal, title: "") { _, _, _ in
         //   addToFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            added.image = UIImage(systemName: "heart.fill")

        
        }
        
        addToFav.image = UIImage(systemName : "heart")
        remove.image = UIImage(systemName: "minus.circle")
        return UISwipeActionsConfiguration(actions: [remove,addToFav,added])
    }
}
