//
//  HeroData.swift
//  Dota2 Hero Stats
//
//  Created by Sebastian Sciuba on 02/11/2020.
//

import Foundation


struct HeroData:Codable{
    let localized_name : String
    let attack_type : String
    let base_health : Int
    let base_mana : Int
    let base_attack_min : Int
    let base_str : Int
    let img : String
    let icon : String
}
