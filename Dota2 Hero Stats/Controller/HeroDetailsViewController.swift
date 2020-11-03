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
    @IBOutlet weak var attackTypeLabel: UILabel!
    @IBOutlet weak var baseHealthLabel: UILabel!
    @IBOutlet weak var baseManaLabel: UILabel!
    @IBOutlet weak var baseStrLabel: UILabel!
    
    
    var heroData : HeroData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = heroData?.localized_name
        print(heroData?.attack_type as Any)
        

    }
    

}
