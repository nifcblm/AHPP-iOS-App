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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        ViewController.saveDataCell(40, temperature: 80, weight: 50, lookUpTable: savedLUT)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let fetchRequest = NSFetchRequest(entityName: "DataCell")
        if let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as? [DataCell] {
            
            println(fetchResults.count)
            println(fetchResults[0].pressure)
            println(fetchResults[0].temperature)
            println(fetchResults[0].weight)
            println(fetchResults[0].lookUpTable)
        }
        
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

