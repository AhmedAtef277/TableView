//
//  homeTableViewCell.swift
//  tableview
//
//  Created by mac on 06/01/2022.
//

import UIKit

class homeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var disc: UILabel!
    @IBOutlet weak var addToFav: UIButton!
    
    
    func setupCell(photo : UIImage , nam : String , pric : Double , discription : String){
        fImg.image = photo
        name.text = nam
        price.text = "\(pric) $"
        disc.text = discription
    }
    
}
