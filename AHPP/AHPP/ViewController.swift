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

    // control click label to code, will generate this
    @IBOutlet weak var pilotName: UILabel!
    @IBOutlet weak var helicopterModel: UILabel!
    @IBOutlet weak var helicopterNumber: UILabel!
    @IBOutlet weak var helicopterEquipedWeight: UILabel!
    
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

