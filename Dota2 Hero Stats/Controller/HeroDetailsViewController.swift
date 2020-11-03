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
    @IBOutlet weak var baseAtackMinLabel: UILabel!
    @IBOutlet weak var baseStrLabel: UILabel!
    
    
    var heroData : HeroData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = heroData?.localized_name
        attackTypeLabel.text = "Atack type: \((heroData?.attack_type)!)"
        baseHealthLabel.text = "Base health: \((heroData?.base_health)!)"
        baseManaLabel.text = "Base mana: \((heroData?.base_mana)!)"
        baseAtackMinLabel.text = "Base min Atack: \((heroData?.base_attack_min)!)"
        baseStrLabel.text = " Base Strenght: \((heroData?.base_str)!)"
        
    }
    
    
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
