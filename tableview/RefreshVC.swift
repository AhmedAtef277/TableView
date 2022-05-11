//
//  RefreshVC.swift
//  tableview
//
//  Created by mac on 26/01/2022.
//

import UIKit

class RefreshVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
   

    @IBOutlet weak var refreshTV: UITableView!
    
    var arrOfData = [String]()
    let refControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTV.dataSource = self
        refreshTV.delegate = self
        refControl.tintColor = UIColor.gray
        refControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        refreshTV.addSubview(refControl)

       
    }
    @objc
    func getData(){
        arrOfData.append("Cell number \(arrOfData.count)")
        refControl.endRefreshing()
        refreshTV.reloadData()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        Cell.textLabel?.text = arrOfData[indexPath.row]
        return Cell
    }
    
    

  

}
