//
//  ContactVC.swift
//  tableview
//
//  Created by mac on 10/01/2022.
//

import UIKit

class ContactVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableOfContacts: UITableView!
    
    var arrOfSection = ["A" , "S"]
    var arrOfRows = [["Ahmed" , "Amr"] , ["Seham"  , "Samia" , "Sara"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableOfContacts.delegate = self
        tableOfContacts.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text=arrOfRows[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfRows[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        arrOfSection.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (arrOfSection[section])
    }
    
    
    

   
}
