//
//  CountryVC.swift
//  tableview
//
//  Created by mac on 28/01/2022.
//

import UIKit

class CountryVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var countryTV: UITableView!
    var arrOfCountry = ["Egypt" , "Turkey" , "Iraq" , "Barcelona"]
    var refreshForSort = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOfCountry.removeAll()
        countryTV.dataSource = self
        countryTV.delegate = self
       
        if arrOfCountry.isEmpty{
            countryTV.isHidden
            let ErrorPhoto = UIImageView(frame: CGRect(x: 50, y: 50, width: view.frame.width-70, height: 200))
            ErrorPhoto.image = UIImage(systemName: "icloud.slash")
            ErrorPhoto.tintColor = UIColor.gray
            view.addSubview(ErrorPhoto)

            let errorText = UILabel(frame: CGRect(x: ErrorPhoto.frame.minX, y: ErrorPhoto.frame.maxY + 20, width: ErrorPhoto.frame.width, height: 50))
            errorText.text = "No data for display"
            errorText.textAlignment = .center

            view.addSubview(errorText)

            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        cell.textLabel?.text = arrOfCountry[indexPath.row]
        return cell
    }
    

   

}
