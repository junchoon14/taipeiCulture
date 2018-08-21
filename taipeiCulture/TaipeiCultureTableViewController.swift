//
//  TaipeiCultureTableViewController.swift
//  taipeiCulture
//http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=35aa3c53-28fb-423c-91b6-2c22432d0d70&format=json
//  Created by Jason Hsu on 2018/8/19.
//  Copyright © 2018 junchoon. All rights reserved.
//http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=bf073841-c734-49bf-a97f-3757a6013812&format=json

import UIKit
import Foundation

class TaipeiCultureTableViewController: UITableViewController {
    
    var cultureEvents = [Event]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let urlStr = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=35aa3c53-28fb-423c-91b6-2c22432d0d70&format=json".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let dic = try? JSONSerialization.jsonObject(with: data) as? [String: Any], let result = dic?["result"] as? [String: Any], let results = result["results"] as? [[String: Any]] {
                    for cultureDic in results {
                        if let event = Event(json: cultureDic) {
                            self.cultureEvents.append(event)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            print(cultureEvents)
            task.resume()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cultureEvents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let event = cultureEvents[indexPath.row]
        cell.textLabel?.text = event.EventName
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = event.ShowGroupName
        
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let event = cultureEvents[indexPath.row]
//
//        if let detailController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
//            detailController.eventImage = event.ImageFile
//            detailController.modalTransitionStyle = .partialCurl
//            present(detailController, animated: true, completion: nil)
//        }
//
//
//    }


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

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailController = segue.destination as? DetailViewController, let row = tableView?.indexPathForSelectedRow!.row {
            detailController.eventDetail = cultureEvents[row]
        }
    }
}
