//
//  SoundsViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 27/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class SoundsViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

	var soundsWonderName: String!
	var soundURL: String!				//declare var so it will be populated from incming segue
	var audioRecorder: AVAudioRecorder?	//used to store in CoreData
	var audioPlayer: AVAudioPlayer?
	
	@IBOutlet weak var soundWonderNameLabel: UILabel!
	@IBOutlet weak var soundSaveConfirmationLabel: UILabel!
	@IBOutlet weak var soundTitleTextField: UITextField!
	@IBOutlet weak var soundRecordPlayStatusLabel: UILabel!
	@IBOutlet weak var recordButtonOutlet: UIButton!
	@IBOutlet weak var stopButtonOutlet: UIButton!
	@IBOutlet weak var playButtonOutlet: UIButton!
	
	
	@IBAction func soundSaveButtonAction(sender: UIBarButtonItem) {
	}
	
	@IBAction func recordButtonAction(sender: UIButton) {
	}
	
	@IBAction func stopButtonAction(sender: UIButton) {
	}
	
	@IBAction func playButtonAction(sender: UIButton) {
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
