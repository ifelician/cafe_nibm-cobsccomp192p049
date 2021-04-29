//
//  FoodTableViewCell.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-29.
//

import UIKit
import Kingfisher

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodDesc: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblDiscount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView(foodItem: foodItem){
        lblFoodName.text = foodItem.foodName
        lblFoodDesc.text = foodItem.foodDesc
        lblFoodPrice.text = "LKR \(foodItem.foodPrice)"
        imgFood.kf.setImage(with: URL(string: foodItem.image))
        
        if foodItem.discount > 0 {
            viewContainer.isHidden = false
            lblDiscount.text = "\(foodItem.discount)%"
        } else {
            viewContainer.isHidden = true
            lblDiscount.text = ""
        }
    }
    
}
