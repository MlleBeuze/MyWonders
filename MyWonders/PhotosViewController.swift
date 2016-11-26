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
import MobileCoreServices

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

	@IBOutlet weak var addImageLabel: UILabel!
	@IBOutlet weak var addImageSwitchLabel: UISwitch!
	@IBOutlet weak var saveImageConfirmationLabel: UILabel!
	@IBOutlet weak var wonderImage: UIImageView!
	
	var photosWonderName: String! //declare var so it will be populated from incoming segue
	var photosSourceType: String! //declare var Library or Camera to be used from incoming segue
	
	@IBAction func addWonderPhotoAction(sender: AnyObject) {
		accessCameraOrPhotoLibrary()
	}
	
	@IBAction func addImagetoCoreDataAction(sender: AnyObject) {
		addImageToCoreData()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
	
		addImageLabel.text = photosWonderName
		addImageSwitchLabel.alpha = 0
		saveImageConfirmationLabel.alpha = 0
	
		accessCameraOrPhotoLibrary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//Select from the photo library
	func accessCameraOrPhotoLibrary(){
		//create instance of the ImagePicker
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		
		
		if photosSourceType == "Photos"{
			if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
				imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
				imagePicker.mediaTypes = [kUTTypeImage as NSString as String]
				presentViewController(imagePicker, animated: true, completion: nil)
			}
		}
	}
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) { //delegate to cancel photo selection from library
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		dismissViewControllerAnimated(true, completion: nil)
		
		let mediaType = info[UIImagePickerControllerMediaType] as! NSString
		
		if mediaType.isEqualToString(kUTTypeImage as NSString as String) { //Media is an image
			let image =  info[UIImagePickerControllerOriginalImage] as! UIImage
			wonderImage.image = image
			wonderImage.contentMode = .ScaleAspectFit
		}
		
		addImageLabel.alpha = 1
		addImageSwitchLabel.alpha = 1
		addImageSwitchLabel.setOn(true, animated: true)
		saveImageConfirmationLabel.alpha = 0
		
		addImageToCoreData()
	}
	
	func addImageToCoreData(){
		let photosAppDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		let photosContext:NSManagedObjectContext = photosAppDel.managedObjectContext
		
		if addImageSwitchLabel.on{
			let newImageData = UIImageJPEGRepresentation(wonderImage.image!, 1) //binary data object of photo image
			
			//inject the photo in the core data
			let newPhoto = NSEntityDescription.insertNewObjectForEntityForName("Photos", inManagedObjectContext: photosContext) as! Photos
			
			newPhoto.wonderName = photosWonderName
			newPhoto.wonderPhoto = newImageData
			
			do{
				try	photosContext.save()
				saveImageConfirmationLabel.alpha = 1
				saveImageConfirmationLabel.text = "Saved Photo of: " + photosWonderName
			} catch _{
				
			}
		}
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
