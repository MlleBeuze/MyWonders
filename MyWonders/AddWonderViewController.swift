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
			target: self, action: "addSaveButtonAction:")
	
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
