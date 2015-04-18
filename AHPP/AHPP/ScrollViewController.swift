//
//  ScrollViewController.swift
//  AHPP
//
//  Created by Hank on 4/10/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import UIKit


class ScrollViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var scrollWheel: UIPickerView!
    @IBOutlet weak var calculateType: UILabel!
    
    var myArray = [String]()
    var secondCurrentInputValues = [String]()
    var selectedValue = ""
    var departureFuelWeightTotal = ""
    var destinationFuelWeightTotal = ""
    var labelText = ""
    
    var mission = ""
    var date = ""
    var time = ""
    var departure = ""
    var destination = ""
    var comment = ""
    var payload = ""
    
    override func viewDidLoad() {
        calculateType.text = labelText
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        //var pressures = getPressures()
        return myArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{

        return myArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedValue = myArray[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var GoBackDestViewController : ViewController = segue.destinationViewController as! ViewController

        if labelText == "Departure Altitude"{
            GoBackDestViewController.currentInputValues[0] = selectedValue
            GoBackDestViewController.currentInputValues[1] = secondCurrentInputValues[1]
            GoBackDestViewController.currentInputValues[2] = secondCurrentInputValues[2]
            GoBackDestViewController.currentInputValues[3] = secondCurrentInputValues[3]
            GoBackDestViewController.departureFuelWeightTotalInt = departureFuelWeightTotal.toInt()!
            GoBackDestViewController.destinationFuelWeightTotalInt = destinationFuelWeightTotal.toInt()!
        }
        
        else if labelText == "Departure Temperature"{
            GoBackDestViewController.currentInputValues[0] = secondCurrentInputValues[0]
            GoBackDestViewController.currentInputValues[1] = selectedValue
            GoBackDestViewController.currentInputValues[2] = secondCurrentInputValues[2]
            GoBackDestViewController.currentInputValues[3] = secondCurrentInputValues[3]
            GoBackDestViewController.departureFuelWeightTotalInt = departureFuelWeightTotal.toInt()!
            GoBackDestViewController.destinationFuelWeightTotalInt = destinationFuelWeightTotal.toInt()!
        }
            
        else if labelText == "Destination Altitude"{
            GoBackDestViewController.currentInputValues[0] = secondCurrentInputValues[0]
            GoBackDestViewController.currentInputValues[1] = secondCurrentInputValues[1]
            GoBackDestViewController.currentInputValues[2] = selectedValue
            GoBackDestViewController.currentInputValues[3] = secondCurrentInputValues[3]
            GoBackDestViewController.departureFuelWeightTotalInt = departureFuelWeightTotal.toInt()!
            GoBackDestViewController.destinationFuelWeightTotalInt = destinationFuelWeightTotal.toInt()!
        }
        
        else if labelText == "Destination Temperature"{
            GoBackDestViewController.currentInputValues[0] = secondCurrentInputValues[0]
            GoBackDestViewController.currentInputValues[1] = secondCurrentInputValues[1]
            GoBackDestViewController.currentInputValues[2] = secondCurrentInputValues[2]
            GoBackDestViewController.currentInputValues[3] = selectedValue
            GoBackDestViewController.departureFuelWeightTotalInt = departureFuelWeightTotal.toInt()!
            GoBackDestViewController.destinationFuelWeightTotalInt = destinationFuelWeightTotal.toInt()!
        }
        
        else if labelText == "Departure Fuel Weight"{
            GoBackDestViewController.currentInputValues = secondCurrentInputValues
            GoBackDestViewController.departureFuelWeightTotalInt = selectedValue.toInt()!
            GoBackDestViewController.destinationFuelWeightTotalInt = destinationFuelWeightTotal.toInt()!
        }
        
        else if labelText == "Destination Fuel Weight"{
            GoBackDestViewController.currentInputValues = secondCurrentInputValues
            GoBackDestViewController.departureFuelWeightTotalInt = departureFuelWeightTotal.toInt()!
            GoBackDestViewController.destinationFuelWeightTotalInt = selectedValue.toInt()!
        }
        
        GoBackDestViewController.missionText = mission
        GoBackDestViewController.dateText = date
        GoBackDestViewController.timeText = time
        GoBackDestViewController.departureText = departure
        GoBackDestViewController.destinationText = destination
        GoBackDestViewController.commentText = comment
        GoBackDestViewController.payloadText = payload
    }
}
