//
//  ViewController.swift
//  tableview
//
//  Created by mac on 06/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var arr = [Fruit]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        getFruitList()
        print(tableview.contentScaleFactor)
    }
    
    
    private func getFruitList(){
        arr.append(Fruit.init(name: "Orange", price: 5, discription: "This is orange ! ", photo: UIImage(named: "orange")!))
        arr.append(Fruit.init(name: "Apple", price: 10, discription: "This is apple ! ", photo: UIImage(named: "apple")!))
        arr.append(Fruit.init(name: "Banana", price: 15, discription: "This is banana ! ", photo: UIImage(named: "banana")!))
        arr.append(Fruit.init(name: "waremelon", price: 20, discription: "This is watermelon ! ", photo: UIImage(named: "watermelon")!))
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableview.dequeueReusableCell(withIdentifier: "homeCell") as! homeTableViewCell
        let data = arr[indexPath.row]
        cell.setupCell(photo: data.photo, nam: data.name, pric: data.price, discription: data.discription)
        cell.addToFav.tag = indexPath.row
        cell.addToFav.addTarget(self, action: #selector(addToFavourite), for: .touchUpInside)
        return cell
        
    }
    @objc func addToFavourite(rection : UIButton){
        print(rection.tag)
        if rection.imageView?.image == UIImage(systemName: "heart.fill"){
            rection.setImage(UIImage(systemName: "heart"), for: .normal)
        }else{
            rection.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
    }
    
}

