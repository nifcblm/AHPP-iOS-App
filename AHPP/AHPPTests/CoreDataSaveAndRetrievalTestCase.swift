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


class CoreDataSaveAndRetrievalTestCase: CoreDataTestCase {
    var lookUpTable:LookUpTable?
    var tableGenerator:LookupTableGeneratorTester?
    var view:ViewController?

    
    override func setUp() {
        super.setUp()
        tableGenerator = Parsing.parseTester(lasvegas)
        view = ViewController()

    }
    
    func testSaveLookUpTable(){
        let md = self.tableGenerator?.getMetaData()

        let lookUp = ViewController.saveLookUpTable(
            md![0] as String,
            contact_number: md![1]as String,
            designated_base: md![2]as String,
            fixed_weight_reduduction: md![3]as NSNumber,
            flight_crew_weight: md![4]as NSNumber,
            gross_weight_limitation_hige: md![5]as NSNumber,
            gross_weight_limitation_hoge: md![6]as NSNumber,
            gross_weight_limitation_hoge_j: md![7]as NSNumber,
            helicopter_equipped_weight: md![8]as NSNumber,
            is_hoge: md![9]as NSNumber,
            make_model: md![10]as String,
            n_number: md![11]as String,
            performance_reference_hige: md![12]as String,
            performance_reference_hoge: md![13]as String,
            pilot_name: md![14]as String,
            has_wat: md![15]as Bool)
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let allHelos = lookUp.managedObjectContext?.executeFetchRequest(fetchRequest, error: nil) as [LookUpTable]
        
        XCTAssertTrue(allHelos.count > 0, "no LookUpTable's found in core data")
        let helo = allHelos.first
        XCTAssertTrue((md![0]as? String) == helo?.company_name, "saveLookUpTable did not save company_name")
        XCTAssertTrue((md![1]as? String) == helo?.contact_number, "saveLookUpTable did not save contact_number")
        XCTAssertTrue((md![2]as? String) == helo?.designated_base, "saveLookUpTable did not save designated_base")
        XCTAssertTrue((md![3]as? NSNumber) == helo?.fixed_weight_reduduction, "saveLookUpTable did not save fixed_weight_reduduction")
        XCTAssertTrue((md![4]as? NSNumber) == helo?.flight_crew_weight, "saveLookUpTable did not save flight_crew_weight")
        XCTAssertTrue((md![5]as? NSNumber) == helo?.gross_weight_limitation_hige, "saveLookUpTable did not save gross_weight_limitation_hige")
        XCTAssertTrue((md![6]as? NSNumber) == helo?.gross_weight_limitation_hoge, "saveLookUpTable did not save gross_weight_limitation_hoge")
        XCTAssertTrue((md![7]as? NSNumber) == helo?.gross_weight_limitation_hoge_j, "saveLookUpTable did not save gross_weight_limitation_hoge_j")
        XCTAssertTrue((md![8]as? NSNumber) == helo?.helicopter_equipped_weight, "saveLookUpTable did not save helicopter_equipped_weight")
        XCTAssertTrue((md![9]as? NSNumber) == helo?.is_hoge, "saveLookUpTable did not save is_hoge")
        XCTAssertTrue((md![10]as? String) == helo?.make_model, "saveLookUpTable did not save make_model")
        XCTAssertTrue((md![11]as? String) == helo?.n_number, "saveLookUpTable did not save n_number")
        XCTAssertTrue((md![12]as? String) == helo?.performance_reference_hige, "saveLookUpTable did not save performance_reference_hige")
        XCTAssertTrue((md![13]as? String) == helo?.performance_reference_hoge, "saveLookUpTable did not save performance_reference_hoge")
        XCTAssertTrue((md![14]as? String) == helo?.pilot_name, "saveLookUpTable did not save pilot_name")
        XCTAssertTrue((md![15]as? Bool) == helo?.has_wat, "saveLookUpTable did not save has_wat")
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
