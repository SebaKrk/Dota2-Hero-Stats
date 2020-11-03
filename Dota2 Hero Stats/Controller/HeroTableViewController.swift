//
//  HeroTableViewController.swift
//  Dota2 Hero Stats
//
//  Created by Sebastian Sciuba on 02/11/2020.
//

import UIKit

class HeroTableViewController: UITableViewController {

    var hero = [HeroData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        performRequest {
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.backgroundColor = UIColor.lightGray
        
        tableView.register(UINib(nibName: "HeroCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        

    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.lightGray
    }
    
  
    // MARK: - dowload JSON
    
    func performRequest(completed: @escaping() -> ())  {
        
        if let url = URL(string: "https://api.opendota.com/api/heroStats") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error masage 1 : \(error!)")
                }
                if let safeData = data {
                    self.parseJSON(appData: safeData)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(appData: Data) {
        let decoder = JSONDecoder()
        do {
            hero = try decoder.decode([HeroData].self, from: appData)
        } catch {
            print("error masage2 : \(error)")
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return  hero.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil) as! HeroCell
        cell.label.text = hero[indexPath.row].localized_name.capitalized
        
        let urlString = "https://api.opendota.com" + hero[indexPath.row].icon
        let url = URL(string: urlString)
        
        cell.heroImageView.downloaded(from: url!)
        

        return cell
    }
    
    
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetaliHero", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroDetailsViewController {
            destination.heroData = hero[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    

}
