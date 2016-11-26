//
//  WondersTableViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import CoreData

class WondersTableViewController: UITableViewController {
	
	var wonders = [Wonders]() //refers to the Wonders class

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
	
	override func viewWillAppear(animated: Bool){
		let wondersAppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		
		let wondersContext:NSManagedObjectContext = wondersAppDel.managedObjectContext
		
		let wonderFetchRequest = NSFetchRequest(entityName: "Wonders")
		
		wonderFetchRequest.predicate = NSPredicate(format: "wonderShow =%@", true)
		
		let sortDescriptor = NSSortDescriptor(key:"wonderName", ascending: true)
		
		wonderFetchRequest.sortDescriptors = [sortDescriptor]
		
		do{
			if let wonderFetchedResults = try wondersContext.executeFetchRequest(wonderFetchRequest) as? [Wonders]{
				wonders = wonderFetchedResults
			}
			else{
				print("ELSE if let results = try.. FAILED")
			}
		}
		catch{
			fatalError("There was an errir fetching the list of groups!")
		}
		
		self.tableView.reloadData()
		

	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wonders.count //to be replaced by Wonder table records
    }

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("WonderCell", forIndexPath: indexPath)

        // Configure the cell...
		let wonder = wonders[indexPath.row]
		cell.textLabel?.text = wonder.wonderName
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
