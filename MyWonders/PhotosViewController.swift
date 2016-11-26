//
//  PhotosViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation //use image picker

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate{

	@IBOutlet weak var addImageLabel: UILabel!
	@IBOutlet weak var addImageSwitchLabel: UISwitch!
	@IBOutlet weak var saveImageConfirmationLabel: UILabel!
	@IBOutlet weak var wonderImage: UIImageView!
	
	var photosWonderName: String! //declare var so it will be populated from incoming segue
	var photosSourceType: String! //declare var Library or Camera to be used from incoming segue
	
	@IBAction func addWonderPhotoAction(sender: AnyObject) {
	}
	
	@IBAction func addImagetoCoreDataAction(sender: AnyObject) {
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
	
		addImageLabel.text = photosWonderName
		addImageSwitchLabel.alpha = 0
		saveImageConfirmationLabel.alpha = 0
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
