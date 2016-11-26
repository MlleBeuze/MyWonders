//
//  AddWonderViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import CoreData

class AddWonderViewController: UIViewController {
	
	@IBOutlet weak var topSaveConfirmationLabel: UILabel!
	@IBOutlet weak var wonderNameTextField: UITextField!
	@IBOutlet weak var wonderLatitudeTextField: UITextField!
	@IBOutlet weak var wonderLongitudeTextField: UITextField!
	@IBOutlet weak var wonderNotesTextView: UITextView!
	
	var wonderName:String = ""
	var wonderLatitude:Double = 0.0
	var wonderLongitude:Double = 0.0
	var wonderNotes:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		let saveRightBarButton = UIBarButtonSystemItem.Save
	
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: saveRightBarButton,
			target: self, action: #selector(AddWonderViewController.addSaveButtonAction(_:)))
	
	topSaveConfirmationLabel.alpha = 0
	wonderNotesTextView.text = ".."
	
    }
	
	@IBAction func addSaveButtonAction(sender: AnyObject){
		wonderName = wonderNameTextField.text!
		wonderLatitude = Double(wonderLatitudeTextField.text!) ?? 0.0
		wonderLongitude = Double(wonderLongitudeTextField.text!) ?? 0.0
		wonderNotes = wonderNotesTextView.text!
		
		//Save the wonder record to Core Data
		let wondersAppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		
		let wondersContext:NSManagedObjectContext = wondersAppDel.managedObjectContext
		
		let newWonder = NSEntityDescription.insertNewObjectForEntityForName("Wonders", inManagedObjectContext: wondersContext) as! Wonders
		
		//value key assignments
		newWonder.wonderName = wonderName
		newWonder.wonderLatitude = wonderLatitude
		newWonder.wonderLongitude = wonderLongitude
		newWonder.wonderShow = true
		newWonder.wonderType = "MY"
		newWonder.wonderNotes = wonderNotesTextView.text
		
// if we remove "as! Wonders"
//		newWonder.setValue(wonderName, forKey: "wonderName")
//		newWonder.setValue(wonderLatitude, forKey: "wonderLatitude")
//		newWonder.setValue(wonderLongitude, forKey: "wonderLongitude")
//		newWonder.setValue(wonderNotes, forKey: "wonderNotes")
//		newWonder.setValue(true, forKey: "wonderShow")
//		newWonder.setValue("MY", forKey: "wonderType")
		
		//save to core data
		do{
			try wondersContext.save()
			topSaveConfirmationLabel.alpha = 1
			topSaveConfirmationLabel.text = "Saved: " + wonderName
		} catch {
			topSaveConfirmationLabel.alpha = 1
			topSaveConfirmationLabel.text = "Error: " + wonderName
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
