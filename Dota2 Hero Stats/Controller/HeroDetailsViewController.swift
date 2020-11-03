//
//  HeroDetailsViewController.swift
//  Dota2 Hero Stats
//
//  Created by Sebastian Sciuba on 02/11/2020.
//

import UIKit

class HeroDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var heroData : HeroData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = heroData?.localized_name
        
    }
    

}
