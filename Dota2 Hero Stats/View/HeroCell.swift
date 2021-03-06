//
//  HeroCell.swift
//  Dota2 Hero Stats
//
//  Created by Sebastian Sciuba on 03/11/2020.
//

import UIKit

class HeroCell: UITableViewCell {
    @IBOutlet weak var heroDataMessage: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        heroDataMessage.layer.cornerRadius = heroDataMessage.frame.size.height / 5
    }

}
