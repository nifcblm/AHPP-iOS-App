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
    }
    
    func testThatWeCanCreateBoss() {
        XCTAssertNotNil(self.lookUpTable, "unable to create a boss")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
