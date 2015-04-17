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
        tableGenerator = ParsingTest.parseTester(test)
        view = ViewController()g

    }
    
    func testGetMyHelo()
    {
        let md = self.tableGenerator?.getMetaData()
        let lookUp = createAndLoadTable(md!)
    }
    
    func testSaveLookUpTable(){
        let md = self.tableGenerator?.getMetaData()
        let lookUp = createTable(md!)
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let allHelos = lookUp.managedObjectContext?.executeFetchRequest(fetchRequest, error: nil) as! [LookUpTable]
        
        XCTAssertTrue(allHelos.count > 0, "no LookUpTable's found in core data")
        let helo = allHelos.first
        XCTAssertNotNil(helo?.company_name, "saveLookUpTable did not save company_name")
        XCTAssertNotNil(helo?.contact_number, "saveLookUpTable did not save contact_number")
        XCTAssertNotNil(helo?.designated_base, "saveLookUpTable did not save designated_base")
        XCTAssertNotNil(helo?.fixed_weight_reduduction, "saveLookUpTable did not save fixed_weight_reduduction")
        XCTAssertNotNil(helo?.flight_crew_weight, "saveLookUpTable did not save flight_crew_weight")
        XCTAssertNotNil(helo?.gross_weight_limitation_hige, "saveLookUpTable did not save gross_weight_limitation_hige")
        XCTAssertNotNil(helo?.gross_weight_limitation_hoge, "saveLookUpTable did not save gross_weight_limitation_hoge")
        XCTAssertNotNil(helo?.gross_weight_limitation_hoge_j, "saveLookUpTable did not save gross_weight_limitation_hoge_j")
        XCTAssertNotNil(helo?.helicopter_equipped_weight, "saveLookUpTable did not save helicopter_equipped_weight")
        XCTAssertNotNil(helo?.is_hoge, "saveLookUpTable did not save is_hoge")
        XCTAssertNotNil(helo?.make_model, "saveLookUpTable did not save make_model")
        XCTAssertNotNil(helo?.n_number, "saveLookUpTable did not save n_number")
        XCTAssertNotNil(helo?.performance_reference_hige, "saveLookUpTable did not save performance_reference_hige")
        XCTAssertNotNil(helo?.performance_reference_hoge, "saveLookUpTable did not save performance_reference_hoge")
        XCTAssertNotNil(helo?.pilot_name, "saveLookUpTable did not save pilot_name")
        XCTAssertNotNil(helo?.has_wat, "saveLookUpTable did not save has_wat")
    }
    
    func testCorrectSaveLookUpTable(){
        let md = self.tableGenerator?.getMetaData()
        let lookUp = createTable(md!)
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let allHelos = lookUp.managedObjectContext?.executeFetchRequest(fetchRequest, error: nil) as! [LookUpTable]
        
        XCTAssertTrue(allHelos.count > 0, "no LookUpTable's found in core data")
        let helo = allHelos.first
        XCTAssertTrue((md![0]as? String) == helo?.company_name, "saveLookUpTable did not save company_name correctly")
        XCTAssertTrue((md![1]as? String) == helo?.contact_number, "saveLookUpTable did not save contact_number correctly")
        XCTAssertTrue((md![2]as? String) == helo?.designated_base, "saveLookUpTable did not save designated_base correctly")
        XCTAssertTrue((md![3]as? NSNumber) == helo?.fixed_weight_reduduction, "saveLookUpTable did not save fixed_weight_reduduction correctly")
        XCTAssertTrue((md![4]as? NSNumber) == helo?.flight_crew_weight, "saveLookUpTable did not save flight_crew_weight correctly")
        XCTAssertTrue((md![5]as? NSNumber) == helo?.gross_weight_limitation_hige,
            "saveLookUpTable did not save gross_weight_limitation_hige correctly")
        XCTAssertTrue((md![6]as? NSNumber) == helo?.gross_weight_limitation_hoge,
            "saveLookUpTable did not save gross_weight_limitation_hoge correctly")
        XCTAssertTrue((md![7]as? NSNumber) == helo?.gross_weight_limitation_hoge_j,
            "saveLookUpTable did not save gross_weight_limitation_hoge_j correctly")
        XCTAssertTrue((md![8]as? NSNumber) == helo?.helicopter_equipped_weight, "saveLookUpTable did not save helicopter_equipped_weight correctly")
        XCTAssertTrue((md![9]as? NSNumber) == helo?.is_hoge, "saveLookUpTable did not save is_hoge correctly")
        XCTAssertTrue((md![10]as? String) == helo?.make_model, "saveLookUpTable did not save make_model correctly")
        XCTAssertTrue((md![11]as? String) == helo?.n_number, "saveLookUpTable did not save n_number correctly")
        XCTAssertTrue((md![12]as? String) == helo?.performance_reference_hige, "saveLookUpTable did not save performance_reference_hige correctly")
        XCTAssertTrue((md![13]as? String) == helo?.performance_reference_hoge, "saveLookUpTable did not save performance_reference_hoge correctly")
        XCTAssertTrue((md![14]as? String) == helo?.pilot_name, "saveLookUpTable did not save pilot_name correctly")
        XCTAssertTrue((md![15]as? Bool) == helo?.has_wat, "saveLookUpTable did not save has_wat correctly")
        
    }
    
    func testSaveDataCell(){
        let md = self.tableGenerator?.getMetaData()
        let lookUp = createTable(md!)
        let higeCells = self.tableGenerator?.getDataCells()
        let hogeCells = self.tableGenerator?.getDataCells()
        let watCells = self.tableGenerator?.getDataCells()
        
        for var i = 0; i<higeCells?.count; i+=3
        {
            XCTAssertNotNil(higeCells![i], "nil in hige temperature")
            XCTAssertNotNil(higeCells![i+1], "nil in hige pressure")
            XCTAssertNotNil(higeCells![i+2], "nil in hige weight")
            ViewController.saveDataCell(higeCells![i], temperature: higeCells![i+1], weight: higeCells![i+2], lookUpTable: lookUp, isHige: true, isHoge: false)
        }
        for var i = 0; i<hogeCells?.count; i+=3
        {
            XCTAssertNotNil(hogeCells![i], "nil in hoge temperature")
            XCTAssertNotNil(hogeCells![i+1], "nil in hoge pressure")
            XCTAssertNotNil(hogeCells![i+2], "nil in hoge weight")
            ViewController.saveDataCell(hogeCells![i], temperature: hogeCells![i+1], weight: hogeCells![i+2], lookUpTable: lookUp, isHige: false, isHoge: true)
        }
        for var i = 0; i<watCells?.count; i+=3
        {
            XCTAssertNotNil(watCells![i], "nil in wat temperature")
            XCTAssertNotNil(watCells![i+1], "nil in wat pressure")
            XCTAssertNotNil(watCells![i+2], "nil in wat weight")
            ViewController.saveDataCell(watCells![i], temperature: watCells![i+1], weight: watCells![i+2], lookUpTable: lookUp, isHige: false, isHoge: false)
        }
        
    }
    
    private func createTable(metaData:[AnyObject]) -> LookUpTable{
        let md = metaData
        let higeCells = self.tableGenerator?.getDataCells()
        let hogeCells = self.tableGenerator?.getDataCells()
        let watCells = self.tableGenerator?.getDataCells()
        
        let lookUp = ViewController.saveLookUpTable(
            md[0] as! String,
            contact_number: md[1]as! String,
            designated_base: md[2]as! String,
            fixed_weight_reduduction: md[3]as! NSNumber,
            flight_crew_weight: md[4]as! NSNumber,
            gross_weight_limitation_hige: md[5]as! NSNumber,
            gross_weight_limitation_hoge: md[6]as! NSNumber,
            gross_weight_limitation_hoge_j: md[7]as! NSNumber,
            helicopter_equipped_weight: md[8]as! NSNumber,
            is_hoge: md[9]as! NSNumber,
            make_model: md[10]as! String,
            n_number: md[11]as! String,
            performance_reference_hige: md[12]as! String,
            performance_reference_hoge: md[13]as! String,
            pilot_name: md[14]as! String,
            has_wat: md[15]as! Bool)
        return lookUp
    }
    
    private func createAndLoadTable(metaData:[AnyObject]) -> LookUpTable{
        let md = metaData
        
        let lookUp = ViewController.saveLookUpTable(
            md[0] as! String,
            contact_number: md[1]as! String,
            designated_base: md[2]as! String,
            fixed_weight_reduduction: md[3]as! NSNumber,
            flight_crew_weight: md[4]as! NSNumber,
            gross_weight_limitation_hige: md[5]as! NSNumber,
            gross_weight_limitation_hoge: md[6]as! NSNumber,
            gross_weight_limitation_hoge_j: md[7]as! NSNumber,
            helicopter_equipped_weight: md[8]as! NSNumber,
            is_hoge: md[9]as! NSNumber,
            make_model: md[10]as! String,
            n_number: md[11]as! String,
            performance_reference_hige: md[12]as! String,
            performance_reference_hoge: md[13]as! String,
            pilot_name: md[14]as! String,
            has_wat: md[15]as! Bool)
        
        return lookUp
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
