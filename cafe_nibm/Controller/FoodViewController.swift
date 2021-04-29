//
//  FoodViewController.swift
//  cafe_nibm
//
//  Created by Felician Ishark on 2021-04-29.
//

import UIKit
import Firebase
import SwiftyJSON

class FoodViewController: UIViewController {
    
    @IBOutlet weak var tblFood: UITableView!
    
    //var foodItem1 =
    var ref: DatabaseReference!
    
    var foodItems: [foodItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFood.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodCellReuseIdentifier")
        ref = Database.database().reference()
        getFoodItemData()
        
    }
    
}

extension FoodViewController{
    func getFoodItemData(){
        ref.child("foodItems").observe(.value, with: {
            (snaphot) in
            
            if let data = snaphot.value {
                if let foodItems = data as? [String: Any]{
                    for item in foodItems {
                        if let foodInfo = item.value as? [String: Any] {
                            let singleFoodItem = foodItem(
                                _id: "",
                                foodName: foodInfo["name"] as! String,
                                foodDesc: foodInfo["description"] as! String,
                                foodPrice: foodInfo["price"] as! Double,
                                discount: foodInfo["discount"] as! Int,
                                image: foodInfo["image"] as! String,
                                category: foodInfo["category"] as! String)
                            
                            self.foodItems.append(singleFoodItem)
                        }
                    }
                    
                    self.tblFood.reloadData()
                }
            }
        })
    }
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFood.dequeueReusableCell(withIdentifier: "FoodCellReuseIdentifier", for: indexPath) as! FoodTableViewCell
        cell.setUpView(foodItem: foodItems[indexPath.row])
        return cell
    }
    
    
}
