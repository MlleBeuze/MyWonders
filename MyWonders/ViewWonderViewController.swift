//
//  ViewWonderViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit

class ViewWonderViewController: UIViewController {

	@IBOutlet weak var wonderNameLabel: UILabel!
	@IBOutlet weak var wonderLatitudeLabel: UILabel!
	@IBOutlet weak var wonderLongitudeLabel: UILabel!
	@IBOutlet weak var wonderTextView: UITextView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		wonderNameLabel.text = viewSelectedWonderName
	
		//Conver CD Lat + Lon doubles to string
	let cellLatitudeDouble:Double = viewSelectedWonderLatitude as Double!
	let cellLatitudeString:String = String(format: "%.6f", cellLatitudeDouble)
	
	let cellLongitudeDouble:Double = viewSelectedWonderLongitude as Double!
	let cellLongitudeString:String = String(format: "%.6f", cellLongitudeDouble)
	
	wonderLatitudeLabel.text = cellLatitudeString
	wonderLongitudeLabel.text = cellLongitudeString
	
	wonderTextView.text = viewSelectedWonderNotes
	
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
