//
//  VegViewController.swift
//  tableview
//
//  Created by mac on 26/01/2022.
//

import UIKit

class VegViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var arrOfPhotos = [UIImage(named: "apple") , UIImage(named: "orange") , UIImage(named: "banana")  ,UIImage(named: "watermelon") , UIImage(named: "car")]
    
    
    @IBOutlet weak var tableV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.dataSource = self
        tableV.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VegTableViewCell
        cell.img.image = arrOfPhotos[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return arrOfPhotos[indexPath.row]!.size.height
        let photo = arrOfPhotos[indexPath.row]
        let ratio = (photo?.size.width ?? 0.0) / (photo?.size.height ?? 0.0)
        return tableView.frame.width / ratio
        
    }
    
    
    
    
    
    
    
    
}
