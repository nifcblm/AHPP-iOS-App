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
    var higeDataCell:HigeDataCell?
    var hogeDataCell:HogeDataCell?
    var watDataCell:WatDataCell?
    
    override func setUp() {
        super.setUp()
        Parsing.parseTester()
        let entity = NSEntityDescription.entityForName("LookUpTable", inManagedObjectContext: managedObjectContext!)
        lookUpTable = LookUpTable(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        higeDataCell = HigeDataCell(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        hogeDataCell = HogeDataCell(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        watDataCell = WatDataCell(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
    }
    
    func testThatWeCanCreateLookUpTable() {
        XCTAssertNotNil(self.lookUpTable, "unable to create a lookUpTable")
    }
    
    func testThatWeCanCreateHigeDataCell(){
        XCTAssertNotNil(self.higeDataCell, "unable to create a higeDataCell")
    }
    
    func testThatWeCanCreateHogeDataCell(){
        XCTAssertNotNil(self.hogeDataCell, "unable to create a hogeDataCell")
    }
    
    func testThatWeCanCreatewatDataCell(){
        XCTAssertNotNil(self.watDataCell, "unable to create a watDataCell")
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
