//
//  TaipeiSpotsTableViewController.swift
//  taipeiCulture
//
//  Created by Jason Hsu on 2018/8/21.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class TaipeiSpotsTableViewController: UITableViewController {

    var spotResults = [SpotResults]()
    var spots = [Spot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlStr = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=bf073841-c734-49bf-a97f-3757a6013812&format=json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
                
                let decoder = JSONDecoder()
                if let data = data, let spotResult = try? decoder.decode(SpotResult.self, from: data) {
                    self.spots = spotResult.result.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            print(spots.count)
            task.resume()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(spots.count)
        return spots.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpotCell", for: indexPath) as? SpotTableViewCell else {
            return UITableViewCell()
        }
        
        let spot = spots[indexPath.row]
        cell.spotName.text = spot.Name
        cell.parkName.text = spot.ParkName
        let urlstr = spot.Image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlstr!)
        cell.spotImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "defaultPhoto"))
        
        return cell
    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            let spot = spots[indexPath.row]
    
            if let spotController = storyboard?.instantiateViewController(withIdentifier: "Spot") as? SpotViewController {
                
                spotController.introSpot = spot

                spotController.modalTransitionStyle = .partialCurl
                present(spotController, animated: true, completion: nil)
            }
    
    
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
