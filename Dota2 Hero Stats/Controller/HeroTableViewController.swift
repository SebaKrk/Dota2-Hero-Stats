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
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = hero[indexPath.row].localized_name.capitalized
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
