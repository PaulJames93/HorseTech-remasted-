//
//  ArticleCell.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var pressed = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteButton.setImage(UIImage(named: "icons8-star-50"), for: .normal)

    }
    @IBAction func pressed(_ sender: Any) {

        if !pressed {
            let image = UIImage(named: "icons8-star-50-2")! as UIImage
            favoriteButton.setImage(image, for: .normal)
            pressed = true

        } else {
            let image = UIImage(named: "icons8-star-50")! as UIImage
            favoriteButton.setImage(image, for: .normal)
            pressed = false
        }

    }
  

}
