//
//  ViewWonderViewController.swift
//  MyWonders
//
//  Created by Mélissa BEUZE on 26/11/16.
//  Copyright © 2016 Mélissa BEUZE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewWonderViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

	@IBOutlet weak var wonderNameLabel: UILabel!
	@IBOutlet weak var wonderLatitudeLabel: UILabel!
	@IBOutlet weak var wonderLongitudeLabel: UILabel!
	@IBOutlet weak var wonderTextView: UITextView!
	
	@IBOutlet weak var wonderMapView: MKMapView!
	
	@IBOutlet weak var wonderImageButtonOutlet: UIButton!
	@IBOutlet weak var numberOfPhotosLabel: UILabel!
	
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
	
		//Convert the lat and lon values to a map location
		let latitude: CLLocationDegrees = viewSelectedWonderLatitude
		let longitude: CLLocationDegrees = viewSelectedWonderLongitude
		
		let deltaLatitude:CLLocationDegrees = 0.01
		let deltaLongitude:CLLocationDegrees = 0.01
		
		let span:MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
		
		let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
		
		let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
		
		wonderMapView.setRegion(region, animated: true)
	
		/* Annotations are pins with text bubbles on the map
		Define annotaton coordinates then text title */
	
		let wonderAnnotation = MKPointAnnotation()
		wonderAnnotation.coordinate = location
		wonderAnnotation.title = viewSelectedWonderName
		wonderMapView.addAnnotation(wonderAnnotation)
	
	
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
