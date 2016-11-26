//
//  WondersTableViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import CoreData

var viewSelectedWonderName: String = ""
var viewSelectedWonderLatitude: Double = 0.0
var viewSelectedWonderLongitude: Double = 0.0
var viewSelectedWonderNotes: String = ""

var editSelectedRow: Int = 0
var editSelectedWonderName: String = ""
var editSelectedWonderLatitude: Double = 0.0
var editSelectedWonderLongitude: Double = 0.0
var editSelectedWonderNotes: String = ""

class WondersTableViewController: UITableViewController {
	
	var wonders = [Wonders]() //refers to the Wonders class

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
	
		//Edit button appeats on the left
		self.navigationItem.leftBarButtonItem = self.editButtonItem()
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
	
		let cellLatitudeDouble:Double = wonder.wonderLatitude as Double!
		let cellLatitudeString:String = String(format: "%.6f", cellLatitudeDouble)
	
	
		let cellLongitudeDouble:Double = wonder.wonderLongitude as Double!
		let cellLongitudeString:String = String(format: "%.6f", cellLongitudeDouble)
	
		cell.detailTextLabel?.text = "Lat: " + cellLatitudeString + " Lon: " + cellLongitudeString
		return cell
    }
	
	// Override to support editing the table view.
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			// Delete the row from the data source
			let wondersAppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
			let wondersContext:NSManagedObjectContext = wondersAppDel.managedObjectContext
			wondersContext.deleteObject(wonders[indexPath.row] as Wonders) //delete from core data
			
			//save to core data
			do{
				try wondersContext.save()
			} catch {
				print("Could not save \(error)")
			}
			
			wonders.removeAtIndex(indexPath.row) //delete frim Array of Wonders
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		} else if editingStyle == .Insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let wonder = wonders[indexPath.row]
		viewSelectedWonderName = wonder.wonderName
		viewSelectedWonderLatitude = wonder.wonderLatitude as Double
		viewSelectedWonderLongitude = wonder.wonderLongitude as Double
		viewSelectedWonderNotes = wonder.wonderNotes
	}
	
	override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
		let wonder = wonders[indexPath.row]
		
		editSelectedRow = indexPath.row
		editSelectedWonderName = wonder.wonderName
		editSelectedWonderLatitude = wonder.wonderLatitude as Double
		editSelectedWonderLongitude = wonder.wonderLongitude as Double
		editSelectedWonderNotes = wonder.wonderNotes
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
