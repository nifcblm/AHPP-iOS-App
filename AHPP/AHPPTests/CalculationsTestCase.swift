//
//  CalculationsTestCase.swift
//  AHPP
//
//  Created by Robby Overy on 4/28/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import XCTest
import AHPP


class CalculationsTestCase: CoreDataTestCase{
    
    var calculationsTester : CalculationsTester?
    
    override func setUp(){
        super.setUp()
        calculationsTester = CalculationsTester()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testGetMyHelo(){
        let myHelo = calculationsTester?.getMyHelo()
        XCTAssertNotNil(myHelo, "helo is null and not supposed to be");
    }
    func testGetHigeWeight(){
        let higeWeight = calculationsTester?.getHigeWeight(0, temperature: 5)
        var correctWeight: NSNumber = 10200
        XCTAssertNotNil(higeWeight, "getHigeWeight returned nil whne it shouldn't")
        XCTAssertEqual(higeWeight!, correctWeight , "getHigeWeight returned the wrong value")
        
    }
    func testGetHogeWeight(){
        let hogeWeight = calculationsTester?.getHogeWeight(0, temperature: 5)
        var correctWeight: NSNumber = 10500
        XCTAssertNotNil(hogeWeight, "getHigeWeight returned nil when it shouldn't")
        XCTAssertEqual(hogeWeight!, correctWeight , "getHigeWeight returned the wrong value")
    }
    func testGetWatWeight(){
        let watWeight = calculationsTester?.getWatWeight(0, temperature: 5)
        var correctWeight: NSNumber = 10200
        XCTAssertNotNil(watWeight, "getHigeWeight returned nil when it shouldn't")
        XCTAssertEqual(watWeight!, correctWeight , "getHigeWeight returned the wrong value")
    }
    func testOperationWeight(){
        let operationWeight = calculationsTester?.operatingWeight(0);
        var correctWeight:NSNumber = 6135
        XCTAssertNotNil(operationWeight," returned nil when it shouldn't")
        XCTAssertEqual(operationWeight!,correctWeight," returned the wrong value")
    }
    func testAdjustedWeight(){
        let depHige = (calculationsTester?.adjustedWeight(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: true))!
        let hige = (calculationsTester?.adjustedWeight(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: false))!
        let depHoge = (calculationsTester?.adjustedWeight(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: true))!
        let hoge = (calculationsTester?.adjustedWeight(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: false))!
        let depHogeJ = (calculationsTester?.adjustedWeight(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0, isDeparture: true))!
        let hogeJ = (calculationsTester?.adjustedWeight(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0, isDeparture: false))!
        let corHige = 9940 as NSNumber
        let corHoge = 10240 as NSNumber
        let corHogeJ = 10500 as NSNumber
        XCTAssertNotNil(depHige,"departure Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,depHige,"departure Hige returned the wrong value")
        XCTAssertNotNil(hige,"Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,hige,"Hige returned the wrong value")
        XCTAssertNotNil(depHoge,"departure Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,depHoge,"departure Hoge returned the wrong value")
        XCTAssertNotNil(hoge," Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,hoge," Hoge returned the wrong value")
        XCTAssertNotNil(depHogeJ,"departure HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,depHogeJ,"departure HogeJ returned the wrong value")
        XCTAssertNotNil(hogeJ,"HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,hogeJ,"HogeJ returned the wrong value")
    }
    func testGrossWeightLimitation(){
        let Hige = (calculationsTester?.grossWeightLimitation(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0))!
        let Hoge = (calculationsTester?.grossWeightLimitation(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0))!
        let HogeJ = (calculationsTester?.grossWeightLimitation(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0))!
        let corHige = 10200 as NSNumber
        let corHoge = 10200 as NSNumber
        let corHogeJ = 10500 as NSNumber
        XCTAssertNotNil(Hige,"Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,Hige,"Hige returned the wrong value")
        XCTAssertNotNil(Hoge,"Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,Hoge,"Hoge returned the wrong value")
        XCTAssertNotNil(HogeJ,"HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,HogeJ,"HogeJ returned the wrong value")
    }
    func testSelectedWeight(){
        let Hige = (calculationsTester?.selectedWeight(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: false))!
        let Hoge = (calculationsTester?.selectedWeight(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: false))!
        let HogeJ = (calculationsTester?.selectedWeight(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0, isDeparture: false))!
        let depHige = (calculationsTester?.selectedWeight(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: true))!
        let depHoge = (calculationsTester?.selectedWeight(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0, isDeparture: true))!
        let depHogeJ = (calculationsTester?.selectedWeight(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0, isDeparture: true))!
        let corHige = 9940 as NSNumber
        let corHoge = 10200 as NSNumber
        let corHogeJ = 10500 as NSNumber
        XCTAssertNotNil(depHige,"departure Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,depHige,"departure Hige returned the wrong value")
        XCTAssertNotNil(Hige,"Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,Hige,"Hige returned the wrong value")
        XCTAssertNotNil(depHoge,"departure Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,depHoge,"departure Hoge returned the wrong value")
        XCTAssertNotNil(Hoge," Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,Hoge," Hoge returned the wrong value")
        XCTAssertNotNil(depHogeJ,"departure HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,depHogeJ,"departure HogeJ returned the wrong value")
        XCTAssertNotNil(HogeJ,"HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,HogeJ,"HogeJ returned the wrong value")
    }
    func testAllowablePayload(){
        let Hige = (calculationsTester?.allowablePayload(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0,fuelWeight: 100, isDeparture: false))!
        let Hoge = (calculationsTester?.allowablePayload(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0,fuelWeight: 100, isDeparture: false))!
        let HogeJ = (calculationsTester?.allowablePayload(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0,fuelWeight: 100, isDeparture: false))!
        let depHige = (calculationsTester?.allowablePayload(true, isHoge: false, isHogeJ: false, pressure: 0, temperature: 0,fuelWeight: 100, isDeparture: true))!
        let depHoge = (calculationsTester?.allowablePayload(false, isHoge: true, isHogeJ: false, pressure: 0, temperature: 0,fuelWeight: 100, isDeparture: true))!
        let depHogeJ = (calculationsTester?.allowablePayload(false, isHoge: false, isHogeJ: true, pressure: 0, temperature: 0,fuelWeight: 100, isDeparture: true))!
        let corHige = 3705 as NSNumber
        let corHoge = 3965 as NSNumber
        let corHogeJ = 4265 as NSNumber
        XCTAssertNotNil(depHige,"departure Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,depHige,"departure Hige returned the wrong value")
        XCTAssertNotNil(Hige,"Hige returned nil when it shouldn't")
        XCTAssertEqual(corHige,Hige,"Hige returned the wrong value")
        XCTAssertNotNil(depHoge,"departure Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,depHoge,"departure Hoge returned the wrong value")
        XCTAssertNotNil(Hoge," Hoge returned nil when it shouldn't")
        XCTAssertEqual(corHoge,Hoge," Hoge returned the wrong value")
        XCTAssertNotNil(depHogeJ,"departure HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,depHogeJ,"departure HogeJ returned the wrong value")
        XCTAssertNotNil(HogeJ,"HogeJ returned nil when it shouldn't")
        XCTAssertEqual(corHogeJ,HogeJ,"HogeJ returned the wrong value")
    }
    func testGetPressures(){
        let pressures = (calculationsTester?.getPressures())!
        let corPressures = ["0","500","1000","1500","2000","2500","3000","3500","4000","4500","5000","5500","6000","6500","7000","7500","8000","8500","9000","9500","10000","10500","11000","11500","12000"]
        
        XCTAssertNotNil(pressures,"pressures returned nil when it shouldn't")
        for i in 0..<pressures.count
        {
            XCTAssertEqual(corPressures[i],pressures[i],"pressures returned the wrong value")
        }

    }
    func testGetTemperatures(){
        let temperatures = (calculationsTester?.getTemperatures())!
        let corTemperatures = ["0","5","10","15","20","25","30","35","40","45"]
        
        XCTAssertNotNil(temperatures,"temperatures returned nil when it shouldn't")
        
        for i in 0..<temperatures.count
        {
            XCTAssertEqual(corTemperatures[i],temperatures[i],"pressures returned the wrong value")
        }
    }
    
    override func tearDown(){
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
 