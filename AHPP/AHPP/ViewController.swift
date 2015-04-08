//
//  ViewController.swift
//  AHPP
//
//  Created by andrew on 3/15/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    /* --------------------- BEGINNING OF LABELS --------------------- */
    
    /*--------------- misc labels on top -----------------*/
    @IBOutlet weak var pilotName: UILabel!
    @IBOutlet weak var helicopterModel: UILabel!
    @IBOutlet weak var helicopterNumber: UILabel!
    @IBOutlet weak var missionDate: UITextField!
    @IBOutlet weak var missionTime: UITextField!
    @IBOutlet weak var mission: UITextField!
    
    /*--------------- row 1 & 2 -----------------*/
    @IBOutlet weak var departureLocation: UITextField!
    @IBOutlet weak var destinationLocation: UITextField!
    
    @IBOutlet weak var depsrtureAltitude: UITextField!
    @IBOutlet weak var departureAirTemperature: UITextField!
    @IBOutlet weak var destinationAltitude: UITextField!
    @IBOutlet weak var destinationAirTemperature: UITextField!
    
    /*----------------- row 3 & 4 ---------------*/
    @IBOutlet weak var helicopterEquiptWeight: UILabel!
    @IBOutlet weak var flightCrewWeight: UILabel!
    
    /*------------- row 5 --------------*/
    @IBOutlet weak var fuelWeightPoundsPerGallon: UILabel!
    @IBOutlet weak var fuelWeightDestination: UILabel!
    @IBOutlet weak var fuelWeightDeparture: UILabel!
    @IBOutlet weak var departurePounds: UILabel!
    @IBOutlet weak var destinationPounds: UILabel!
    
    /*------------------ row 6 ----------------*/
    @IBOutlet weak var operatingWeightDeparture: UILabel!
    @IBOutlet weak var operatingWeightDestination: UILabel!
    
    
    /*-------------------- rows 7a - 13 --------------------*/
    //departure labels
    @IBOutlet weak var computerGrossWeightHIGE: UILabel!
    @IBOutlet weak var computerGrossWeightHOGE: UILabel!
    @IBOutlet weak var computedGrossWeightHOGEJ: UILabel!
    @IBOutlet weak var weightReductionHIGE: UILabel!
    @IBOutlet weak var weightReductionHOGE: UILabel!
    @IBOutlet weak var weightReductionHOGEJ: UILabel!
    @IBOutlet weak var adjustedWeightHIGE: UILabel!
    @IBOutlet weak var adjustedWeightHOGE: UILabel!
    @IBOutlet weak var adjustedWeightHOGEJ: UILabel!
    @IBOutlet weak var grossWeightLimitationHIGE: UILabel!
    @IBOutlet weak var grossWeightLimitationHOGE: UILabel!
    @IBOutlet weak var grossWeightLimitationHOGEJ: UILabel!
    @IBOutlet weak var selectedWeightHIGE: UILabel!
    @IBOutlet weak var selectedWeightHOGE: UILabel!
    @IBOutlet weak var selectedWeightHOGEJ: UILabel!
    @IBOutlet weak var operatingWeightHIGE: UILabel!
    @IBOutlet weak var operatingWeightHOGE: UILabel!
    @IBOutlet weak var operatingWeightHOGEJ: UILabel!
    @IBOutlet weak var allowablePayloadHIGE: UILabel!
    @IBOutlet weak var allowablePayloadHOGE: UILabel!
    @IBOutlet weak var allowablePayloadHOGEJ: UILabel!
    @IBOutlet weak var exceedsHIGE: UILabel!
    @IBOutlet weak var exceedsHOGE: UILabel!
    @IBOutlet weak var exceedsHOGEJ: UILabel!
    
    //destination labels
    @IBOutlet weak var destinationComputedGrossWeightHIGE: UILabel!
    @IBOutlet weak var destinationComputedGrossWeightHOGE: UILabel!
    @IBOutlet weak var destinationComputedGrossWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationWeightReductionHIGE: UILabel!
    @IBOutlet weak var destinationWeightReductionHOGE: UILabel!
    @IBOutlet weak var destinationWeightReductionHOGEJ: UILabel!
    @IBOutlet weak var destinationadjustedWeightHIGE: UILabel!
    @IBOutlet weak var destinationAdjustedWeightHOGE: UILabel!
    @IBOutlet weak var destinationAdjustedWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationGrossWeightLimitationHIGE: UILabel!
    @IBOutlet weak var destinationGrossWeightLimitationHOGE: UILabel!
    @IBOutlet weak var destinationGrossWeightLimitationHOGEJ: UILabel!
    @IBOutlet weak var destinationSelectedWeightHIGE: UILabel!
    @IBOutlet weak var destinationSelectedWeightHOGE: UILabel!
    @IBOutlet weak var destinationSelectedWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationOperatingWeightHIGE: UILabel!
    @IBOutlet weak var destinationOperatingWeightHOGE: UILabel!
    @IBOutlet weak var destinationOperatingWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationAllowablePayloadHIGE: UILabel!
    @IBOutlet weak var destinationAllowablePayloadHOGE: UILabel!
    @IBOutlet weak var destinationAllowablePayloadHOGEJ: UILabel!
    @IBOutlet weak var destinationExceedsHIGE: UILabel!
    @IBOutlet weak var destinationExceedsHOGE: UILabel!
    @IBOutlet weak var destinationExceedsHOGEJ: UILabel!
    
    /* --------------------- END OF LABELS --------------------- */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test pilot information
        var savedLUT = ViewController.saveLookUpTable(
            "ACME INC",
            contact_number: "208-999-9999",
            designated_base: "Podunk ID",
            fixed_weight_reduduction: 400,
            flight_crew_weight: 200,
            gross_weight_limitation_hige: 300,
            gross_weight_limitation_hoge: 100,
            gross_weight_limitation_hoge_j: 200,
            helicopter_equipped_weight: 100,
            is_hoge: 50,
            make_model: "Apache",
            n_number: "4",
            performance_reference_hige: "Great",
            performance_reference_hoge: "So Great",
            pilot_name: "John Smith")
        
        // Save the test pilot
        ViewController.saveDataCell(40, temperature: 80, weight: 50, lookUpTable: savedLUT)
        
        // Helicopter object
        var helicopter = getMyHelo();
        
        // Will set name to "John Smith"
        pilotName.text = helicopter.pilot_name
        helicopterModel.text = helicopter.make_model
        helicopterNumber.text = helicopter.n_number
        
        // NSInt to NSString example
        helicopterEquipedWeight.text = helicopter.helicopter_equipped_weight.stringValue

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getMyHelo() -> LookUpTable {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!

        
        let fetchRequest2 = NSFetchRequest(entityName: "LookUpTable")
        let fetchResults = context.executeFetchRequest(fetchRequest2, error: nil) as [LookUpTable]
        return fetchResults.first!
    }


    class func saveDataCell(
        pressure: NSNumber,
        temperature: NSNumber,
        weight: NSNumber,
        lookUpTable: LookUpTable
        ) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("DataCell", inManagedObjectContext: context) as DataCell
            
        newDataCell.pressure = pressure
        newDataCell.temperature = temperature
        newDataCell.weight = weight
        newDataCell.lookUpTable = lookUpTable
            
//        let fetchRequest2 = NSFetchRequest(entityName: "DataCell")
//        if let fetchResults = context.executeFetchRequest(fetchRequest2, error: nil) as? [DataCell] {
////            println(fetchResults.count)
//        }
        
    }
    
    
    class func saveLookUpTable(
        company_name: String,
        contact_number: String,
        designated_base: String,
        fixed_weight_reduduction: NSNumber,
        flight_crew_weight: NSNumber,
        gross_weight_limitation_hige: NSNumber,
        gross_weight_limitation_hoge: NSNumber,
        gross_weight_limitation_hoge_j: NSNumber,
        helicopter_equipped_weight: NSNumber,
        is_hoge: NSNumber,
        make_model: String,
        n_number: String,
        performance_reference_hige: String,
        performance_reference_hoge: String,
        pilot_name: String) -> LookUpTable {
            
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!

        let newLookUpTable = NSEntityDescription.insertNewObjectForEntityForName("LookUpTable", inManagedObjectContext: context) as LookUpTable
        
        newLookUpTable.company_name = company_name
        newLookUpTable.contact_number = contact_number
        newLookUpTable.designated_base = designated_base
        newLookUpTable.fixed_weight_reduduction = fixed_weight_reduduction
        newLookUpTable.flight_crew_weight = flight_crew_weight
        newLookUpTable.gross_weight_limitation_hige = gross_weight_limitation_hige
        newLookUpTable.gross_weight_limitation_hoge = gross_weight_limitation_hoge
        newLookUpTable.gross_weight_limitation_hoge_j = gross_weight_limitation_hoge_j
        newLookUpTable.helicopter_equipped_weight = helicopter_equipped_weight
        newLookUpTable.is_hoge = is_hoge
        newLookUpTable.make_model = make_model
        newLookUpTable.n_number = n_number
        newLookUpTable.performance_reference_hige = performance_reference_hige
        newLookUpTable.performance_reference_hoge = performance_reference_hoge
        newLookUpTable.pilot_name = pilot_name
        
        return newLookUpTable
    }
}

