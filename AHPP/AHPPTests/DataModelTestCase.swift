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

class DataModelTestCase: CoreDataTestCase {
    var lookUpTable:LookUpTable?
    var higeDataCell:HigeDataCell?
    var hogeDataCell:HogeDataCell?
    var watDataCell:WatDataCell?
    
    override func setUp() {
        super.setUp()
        lookUpTable = (NSEntityDescription.insertNewObjectForEntityForName(
            "LookUpTable", inManagedObjectContext: managedObjectContext!) as! LookUpTable)
        higeDataCell = (NSEntityDescription.insertNewObjectForEntityForName(
            "HigeDataCell", inManagedObjectContext: managedObjectContext!) as! HigeDataCell)
        hogeDataCell = (NSEntityDescription.insertNewObjectForEntityForName(
            "HogeDataCell", inManagedObjectContext: managedObjectContext!) as! HogeDataCell)
        watDataCell = (NSEntityDescription.insertNewObjectForEntityForName(
            "WatDataCell", inManagedObjectContext: managedObjectContext!) as! WatDataCell)
    }
    
    func testThatWeCanCreateLookUpTable() {
        XCTAssertNotNil(self.lookUpTable, "unable to create a lookUpTable")
    }
    
    func testThatWeCanSetLookUpTableMetaData(){
        self.lookUpTable?.company_name = "a"
        self.lookUpTable?.contact_number = "b"
        self.lookUpTable?.designated_base = "c"
        self.lookUpTable?.fixed_weight_reduduction = 0
        self.lookUpTable?.flight_crew_weight = 1
        self.lookUpTable?.gross_weight_limitation_hige = 2
        self.lookUpTable?.gross_weight_limitation_hoge = 3
        self.lookUpTable?.gross_weight_limitation_hoge_j = 4
        self.lookUpTable?.helicopter_equipped_weight = 5
        self.lookUpTable?.is_hoge = false
        self.lookUpTable?.make_model = "d"
        self.lookUpTable?.n_number = "e"
        self.lookUpTable?.performance_reference_hige = "f"
        self.lookUpTable?.performance_reference_hoge = "g"
        self.lookUpTable?.pilot_name = "h"
        self.lookUpTable?.has_wat = false
        XCTAssertTrue(self.lookUpTable?.company_name == "a", "unable to set company_name")
        XCTAssertTrue(self.lookUpTable?.contact_number == "b" , "unable to set contact_number")
        XCTAssertTrue(self.lookUpTable?.designated_base == "c", "unable to set designated_base")
        XCTAssertTrue(self.lookUpTable?.fixed_weight_reduduction == 0 , "unable to set fixed fixed_weight_reduduction")
        XCTAssertTrue(self.lookUpTable?.flight_crew_weight == 1 , "unable to set flight_crew_weight")
        XCTAssertTrue(self.lookUpTable?.gross_weight_limitation_hige == 2 , "unable to set gross_weight_limitation_hige")
        XCTAssertTrue(self.lookUpTable?.gross_weight_limitation_hoge == 3 , "unable to set gross_weight_limitation_hoge")
        XCTAssertTrue(self.lookUpTable?.gross_weight_limitation_hoge_j == 4 , "unable to set gross_weight_limitation_hoge_j")
        XCTAssertTrue(self.lookUpTable?.helicopter_equipped_weight == 5, "unable to set helicopter_equipped_weight")
        XCTAssertTrue(self.lookUpTable?.is_hoge == false, "unable to set is_hoge")
        XCTAssertTrue(self.lookUpTable?.make_model == "d", "unable to set make_model")
        XCTAssertTrue(self.lookUpTable?.n_number == "e", "unable to set n_number")
        XCTAssertTrue(self.lookUpTable?.performance_reference_hige == "f", "unable to set performance_reference_hige")
        XCTAssertTrue(self.lookUpTable?.performance_reference_hoge == "g", "unable to set performance_reference_hoge")
        XCTAssertTrue(self.lookUpTable?.pilot_name == "h", "unable to set pilot_name")
        XCTAssertTrue(self.lookUpTable?.has_wat == false, "unable to set has_wat")

    }
    
    func testThatWeCanCreateHigeDataCell(){
        XCTAssertNotNil(self.higeDataCell, "unable to create a higeDataCell")
    }
    
    func testThatWeCanSetHigeDataCellData(){
        self.higeDataCell?.temperature = 0
        self.higeDataCell?.pressure = 1
        self.higeDataCell?.weight = 2
        self.higeDataCell?.lookUpTable = self.lookUpTable!
        XCTAssertTrue(self.higeDataCell?.temperature == 0, "unabe to set temperature")
        XCTAssertTrue(self.higeDataCell?.pressure == 1, "unabe to set pressure")
        XCTAssertTrue(self.higeDataCell?.weight == 2, "unabe to set weight")
        XCTAssertTrue(self.higeDataCell?.lookUpTable === self.lookUpTable, "unabe to set lookUpTable")
    }
    
    func testThatWeCanCreateHogeDataCell(){
        XCTAssertNotNil(self.hogeDataCell, "unable to create a hogeDataCell")
    }
    
    func testThatWeCanSetHogeDataCellData(){
        self.hogeDataCell?.temperature = 0
        self.hogeDataCell?.pressure = 1
        self.hogeDataCell?.weight = 2
        self.hogeDataCell?.lookUpTable = self.lookUpTable!
        XCTAssertTrue(self.hogeDataCell?.temperature == 0, "unabe to set temperature")
        XCTAssertTrue(self.hogeDataCell?.pressure == 1, "unabe to set pressure")
        XCTAssertTrue(self.hogeDataCell?.weight == 2, "unabe to set weight")
        XCTAssertTrue(self.hogeDataCell?.lookUpTable === self.lookUpTable, "unabe to set lookUpTable")
    }
    
    func testThatWeCanCreatewatDataCell(){
        XCTAssertNotNil(self.watDataCell, "unable to create a watDataCell")
    }
    
    func testThatWeCanSetWatDataCellData(){
        self.watDataCell?.temperature = 0
        self.watDataCell?.pressure = 1
        self.watDataCell?.weight = 2
        self.watDataCell?.lookUpTable = self.lookUpTable!
        XCTAssertTrue(self.watDataCell?.temperature == 0, "unabe to set temperature")
        XCTAssertTrue(self.watDataCell?.pressure == 1, "unabe to set pressure")
        XCTAssertTrue(self.watDataCell?.weight == 2, "unabe to set weight")
        XCTAssertTrue(self.watDataCell?.lookUpTable === self.lookUpTable, "unabe to set lookUpTable")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
