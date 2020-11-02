//
//  HeroManager.swift
//  Dota2 Hero Stats
//
//  Created by Sebastian Sciuba on 02/11/2020.
//

import Foundation

protocol HeroManagerDelegate {
    func didUpdateHero (hero: HeroModel)
}

var hero = [HeroData]()

struct HeroManager {
    
    var delegate: HeroManagerDelegate?
    
    func performRequest() {
        if let url = URL(string: "https://api.opendota.com/api/heroStats") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error msage: \(error!)")
                    return
                }
                if let safeData = data {
//                    if let heroData = self.
                    parseJSON(appData: safeData)
//                    {
//                        self.delegate?.didUpdateHero(hero: heroData)
//                    }
                    
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(appData: Data) {
        let decoder = JSONDecoder()
        do {
            hero = try decoder.decode([HeroData].self, from: appData)
            
            print(hero)
//            let decodedData = try decoder.decode(HeroData.self, from: appData)
//            print(decodedData.hero)
//            print(decodedData.hero[0].localized_name)
//            let name = decodedData.hero[0].localized_name
            
//            print(decodedData.hero[0].img)
//            let img = decodedData.hero[0].img
            
//            let heroData = HeroModel(localized_name: name, img: img)
//            return heroData
            
            
        } catch {
            print("error masage in do/catch block: \(error)")
//            return nil
        }
        
    }
    
}
