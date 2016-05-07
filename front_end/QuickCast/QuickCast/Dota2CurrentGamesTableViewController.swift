//
//  Dota2CurrentGamesTableViewController.swift
//  QuickCast
//
//  Created by David Chen on 5/6/16.
//  Copyright © 2016 David Chen. All rights reserved.
//

import UIKit
import SwiftyJSON

<<<<<<< Updated upstream
=======
class Dota2CurrentGamesTableViewController: UITableViewController {
    
    var NumberofRows = 10
    
    var simpleData = [String]()
>>>>>>> Stashed changes

class Dota2CurrentGamesTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NumberofRows
    }
    
    func parseJSON(){
        let path : String = NSBundle.mainBundle().pathForResource("jsonFile", ofType: "json") as String!
        
        //change next line to URL when getting from server
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let parsedJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        let team1 = parsedJSON["dire_team"]["team_name"].string as String!
        let team2 = parsedJSON["radiant_team"]["team_name"].string as String!
        let team1wins = parsedJSON["dire_series_wins"].string as String!
        let team2wins = parsedJSON["radiant_series_wins"].string as String!
        
        simpleData.append(team1)
        simpleData.append(team2)
        simpleData.append(team1wins)
        simpleData.append(team2wins)
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL", forIndexPath: indexPath)

        cell.textLabel?.text = simpleData[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
