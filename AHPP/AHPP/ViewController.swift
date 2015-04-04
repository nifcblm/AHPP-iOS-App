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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    class func saveLookUpTable(lookUpTableData: LookUpTable) -> LookUpTable {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!

        let newLookUpTable = NSEntityDescription.insertNewObjectForEntityForName("LookUpTable", inManagedObjectContext: context) as LookUpTable
        
        newLookUpTable.company_name = lookUpTableData.company_name
        newLookUpTable.contact_number = lookUpTableData.contact_number
        newLookUpTable.designated_base = lookUpTableData.designated_base
        newLookUpTable.fixed_weight_reduduction = lookUpTableData.fixed_weight_reduduction
        newLookUpTable.flight_crew_weight = lookUpTableData.flight_crew_weight
        newLookUpTable.gross_weight_limitation_hige = lookUpTableData.gross_weight_limitation_hige
        newLookUpTable.gross_weight_limitation_hoge = lookUpTableData.gross_weight_limitation_hoge
        newLookUpTable.gross_weight_limitation_hoge_j = lookUpTableData.gross_weight_limitation_hoge_j
        newLookUpTable.helicopter_equipped_weight = lookUpTableData.helicopter_equipped_weight
        newLookUpTable.is_hoge = lookUpTableData.is_hoge
        newLookUpTable.make_model = lookUpTableData.make_model
        newLookUpTable.n_number = lookUpTableData.n_number
        newLookUpTable.performance_reference_hige = lookUpTableData.performance_reference_hige
        newLookUpTable.performance_reference_hoge = lookUpTableData.performance_reference_hoge
        newLookUpTable.pilot_name = lookUpTableData.pilot_name
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        if let fetchResults = context.executeFetchRequest(fetchRequest, error: nil) as? [LookUpTable] {
            println(fetchResults.count)
            println(fetchResults[0].company_name)

        }
        
        return newLookUpTable
    }
}

