//
//  EditWonderViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import CoreData

class EditWonderViewController: UIViewController {

	@IBOutlet weak var editSaveConfirmationLabel: UILabel!
	@IBOutlet weak var wonderNameTextField: UITextField!
	@IBOutlet weak var wonderLatitudeTextField: UITextField!
	@IBOutlet weak var wonderLongitudeTextField: UITextField!
	@IBOutlet weak var wonderNotesTextView: UITextView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		wonderNameTextField.text = editSelectedWonderName
		
		//Conver CD Lat + Lon doubles to string
		let cellLatitudeDouble:Double = editSelectedWonderLatitude as Double!
		let cellLatitudeString:String = String(format: "%.6f", cellLatitudeDouble)
		
		let cellLongitudeDouble:Double = editSelectedWonderLongitude as Double!
		let cellLongitudeString:String = String(format: "%.6f", cellLongitudeDouble)
		
		wonderLatitudeTextField.text = cellLatitudeString
		wonderLongitudeTextField.text = cellLongitudeString
		
		wonderNotesTextView.text = editSelectedWonderNotes
	
		editSaveConfirmationLabel.alpha = 0
	
		let saveRightBarButton = UIBarButtonSystemItem.Save
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: saveRightBarButton,
			target: self, action: #selector(EditWonderViewController.editSaveButtonAction(_:)))
    }
	
	@IBAction func editSaveButtonAction(sender: AnyObject){
		//Save the wonder record to Core Data
		
		var wonders = [Wonders]()
		
		let wondersAppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		let wondersContext:NSManagedObjectContext = wondersAppDel.managedObjectContext
		let wonderFetchRequest = NSFetchRequest(entityName: "Wonders")
		
		do{
			if let wonderFetchedResults = try wondersContext.executeFetchRequest(wonderFetchRequest) as? [Wonders]{
				wonders = wonderFetchedResults
			}
			else{
				print("ELSE if let results = try.. FAILED")
			}
		}
		catch{
			fatalError("There was an error fetching the list of groups!")
		}
		
		let wonder = wonders[editSelectedRow]
		
		wonder.wonderName = wonderNameTextField.text!
		wonder.wonderLatitude = Double(wonderLatitudeTextField.text!) ?? 0.0
		wonder.wonderLongitude = Double(wonderLongitudeTextField.text!) ?? 0.0
		wonder.wonderNotes = wonderNotesTextView.text!

		//save to core data
		do{
			try wondersContext.save()
			editSaveConfirmationLabel.alpha = 1
			editSaveConfirmationLabel.text = "Saved: " + wonderNameTextField.text!
		} catch {
			editSaveConfirmationLabel.alpha = 1
			editSaveConfirmationLabel.text = "Error: " + wonderNameTextField.text!
			print("Could not save \(error)")
		}
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
