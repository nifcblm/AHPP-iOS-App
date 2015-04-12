//
//  LookUpTestCase.swift
//  AHPP
//
//  Created by Robby Overy on 4/11/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import XCTest
import CoreData
import AHPP


class LookUpTestCase: CoreDataTestCase {
    var lookUpTable:LookUpTable?

    
    override func setUp() {
        super.setUp()
        let entity = NSEntityDescription.entityForName("LookUpTable", inManagedObjectContext: managedObjectContext!)
        lookUpTable = LookUpTable(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
//        higeDataCell = HigeDataCell(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
//        hogeDataCell = HogeDataCell(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
//        watDataCell = WatDataCell(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
    }
    
//    func testMetaSet(){
//        
//    }
    
//    private func saveLookUpTable(
//        company_name: String,
//        contact_number: String,
//        designated_base: String,
//        fixed_weight_reduduction: NSNumber,
//        flight_crew_weight: NSNumber,
//        gross_weight_limitation_hige: NSNumber,
//        gross_weight_limitation_hoge: NSNumber,
//        gross_weight_limitation_hoge_j: NSNumber,
//        helicopter_equipped_weight: NSNumber,
//        is_hoge: NSNumber,
//        make_model: String,
//        n_number: String,
//        performance_reference_hige: String,
//        performance_reference_hoge: String,
//        pilot_name: String,
//        has_wat: Bool) {
//            
//            
////            lookUpTable.company_name = company_name
////            lookUpTable.contact_number = contact_number
////            lookUpTable.designated_base = designated_base
////            lookUpTable.fixed_weight_reduduction = fixed_weight_reduduction
////            lookUpTable.flight_crew_weight = flight_crew_weight
////            lookUpTable.gross_weight_limitation_hige = gross_weight_limitation_hige
////            lookUpTable.gross_weight_limitation_hoge = gross_weight_limitation_hoge
////            lookUpTable.gross_weight_limitation_hoge_j = gross_weight_limitation_hoge_j
////            lookUpTable.helicopter_equipped_weight = helicopter_equipped_weight
////            lookUpTable.is_hoge = is_hoge
////            lookUpTable.make_model = make_model
////            lookUpTable.n_number = n_number
////            lookUpTable.performance_reference_hige = performance_reference_hige
////            lookUpTable.performance_reference_hoge = performance_reference_hoge
////            lookUpTable.pilot_name = pilot_name
////            lookUpTable.has_wat = has_wat
//
//    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
