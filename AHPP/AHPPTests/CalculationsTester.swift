//
//  CalculationsTest.swift
//  AHPP
//
//  Created by Robby Overy on 4/28/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import CoreData
import AHPP


public class CalculationsTester{
    
    let weightreduction = 0
    let test = "LakeviewAHPP.csv"

    var lookUpTable:LookUpTable?
    var tableGenerator:LookupTableGeneratorTester?
    var view:ViewController?
    
    
    init() {
        tableGenerator = ParsingTest.parseTester(test)
        view = ViewController()
        let md = self.tableGenerator?.getMetaData()
        lookUpTable = createAndLoadTable(md!)
        
    }
    
    public func getHigeWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let myHelo = getMyHelo() as LookUpTable!
        var weight: NSNumber = -5, higeDataCells : NSSet = myHelo.higeDataCells
        
        for item in higeDataCells.allObjects as! [HigeDataCell] {
            if (item.pressure == pressure && item.temperature == temperature) {
                weight = item.weight
            }
        }
        return weight
    }

    public func getHogeWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let myHelo = getMyHelo() as LookUpTable!
        var weight : NSNumber = 0, hogeDataCells : NSSet = myHelo.hogeDataCells
        
        for item in hogeDataCells.allObjects as! [HogeDataCell] {
            if (item.pressure == pressure && item.temperature == temperature) {
                weight = item.weight
            }
        }
        return weight
    }

    public func getWatWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let myHelo = getMyHelo() as LookUpTable!
        var weight : NSNumber = 0, watDataCells : NSSet = myHelo.watDataCells
        
        for item in watDataCells.allObjects as! [WatDataCell] {
            if (item.pressure == pressure && item.temperature == temperature) {
                weight = item.weight
            }
        }
        return weight
    }

    public func operatingWeight(fuelWeight: NSInteger) -> NSInteger {
        let myHelo = getMyHelo() as LookUpTable!
        return myHelo.helicopter_equipped_weight.integerValue + myHelo.flight_crew_weight.integerValue + fuelWeight
    }

    public func adjustedWeight(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSNumber, temperature: NSNumber, isDeparture: Bool) -> NSInteger {
        let myHelo = getMyHelo() as LookUpTable!
        
        if isHogeJ {
            if isDeparture {
                return getHogeWeight(pressure, temperature: temperature).integerValue - weightreduction
            } else {
                return getHogeWeight(pressure, temperature: temperature).integerValue - weightreduction
                
            }
        } else if isHoge {
            return getHogeWeight(pressure, temperature: temperature).integerValue - myHelo.fixed_weight_reduduction.integerValue
        }
        else {
            return getHigeWeight(pressure, temperature: temperature).integerValue - myHelo.fixed_weight_reduduction.integerValue
        }
    }

    public func grossWeightLimitation(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSInteger, temperature:NSInteger) -> NSInteger {
        let myHelo = getMyHelo() as LookUpTable!
        
        var weight : NSInteger = 0
        if isHige {
            weight = myHelo.gross_weight_limitation_hige as NSInteger
        } else if isHoge{
            weight = myHelo.gross_weight_limitation_hoge as NSInteger
            
        }else if isHogeJ{
            weight = myHelo.gross_weight_limitation_hoge_j as NSInteger
        }
        
        if myHelo.has_wat {
            var x : NSInteger = 0
            var y : NSInteger = 0
            if isHige || isHoge {
                x = weight
                y = self.getWatWeight(pressure, temperature: temperature) as NSInteger
                weight = (x < y) ? x : y
            }
        }
        return weight
    }

    public func selectedWeight(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSInteger, temperature: NSInteger, isDeparture: Bool) -> NSInteger {
        let adjustedWeightValue = adjustedWeight(isHige, isHoge: isHoge, isHogeJ: isHogeJ, pressure: pressure, temperature: temperature, isDeparture: isDeparture)
        let grossWeightLimitationValue = grossWeightLimitation(isHige, isHoge: isHoge, isHogeJ: isHogeJ, pressure: pressure, temperature: temperature)
        
        if adjustedWeightValue < grossWeightLimitationValue {
            return adjustedWeightValue
        } else {
            return grossWeightLimitationValue
        }
    }

    public func allowablePayload(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSInteger, temperature:   NSInteger, fuelWeight: NSInteger, isDeparture: Bool) -> NSInteger{
        return selectedWeight(isHige, isHoge: isHoge, isHogeJ: isHogeJ,  pressure: pressure, temperature: temperature, isDeparture: isDeparture) - operatingWeight(fuelWeight)
    }

    public func getPressures() -> [String] {
        let myHelo = getMyHelo() as LookUpTable!
        var pressures = [Int](), higeDataCells = myHelo.higeDataCells
        
        for item in higeDataCells.allObjects {
            let pressure = item.pressure as NSInteger
            if !contains(pressures, pressure) {
                pressures.append(pressure)
            }
        }
        
        pressures = sorted(pressures)
        
        var pressureStrings = [String]()
        for num in pressures {
            pressureStrings.append(String(num))
        }
        
        return pressureStrings
    }

    public func getTemperatures() -> [String] {
        let myHelo = getMyHelo() as LookUpTable!
        var temperatures = [Int](), higeDataCells = myHelo.higeDataCells
        
        for item in higeDataCells.allObjects {
            let temperature = item.temperature as NSInteger
            if !contains(temperatures, temperature) {
                temperatures.append(temperature)
            }
        }
        
        temperatures = sorted(temperatures)
        
        var temperatureStrings = [String]()
        for num in temperatures {
            temperatureStrings.append(String(num))
        }
        
        return temperatureStrings
    }
    
    public  func getMyHelo() -> LookUpTable? {
        let context = lookUpTable?.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "created_at", ascending: false)]
        let allHelos = context!.executeFetchRequest(fetchRequest, error: nil) as! [LookUpTable]
        
        if allHelos.count > 0 {
            return allHelos.first!
        } else {
            return nil
        }
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
        
        var table : Array2D = (tableGenerator?.getArray2DDataCells())!
        
        if(table.colCount()>0 && table.rowCount()>0)
        {
            for col in 1..<table.colCount()
            {
                for row in 1..<table.rowCount()
                {
                    if(table[col,row] != nil && table[col,row]>=0)
                    {
                        ViewController.saveDataCell(
                            table[0,row-1]!,
                            temperature: table[col, 0]!,
                            weight: table[col,row]!,
                            lookUpTable: lookUp,
                            isHige: true,
                            isHoge: false)
                    }
                }
            }
        }
    
        table  = (tableGenerator?.getArray2DDataCells())!
        
        if(table.colCount()>0 && table.rowCount()>0)
        {
            for col in 1..<table.colCount()
            {
                for row in 1..<table.rowCount()
                {
                    if(table[col,row] != nil && table[col,row]>=0)
                    {
                        ViewController.saveDataCell(
                            table[0,row-1]!,
                            temperature: table[col, 0]!,
                            weight: table[col,row]!,
                            lookUpTable: lookUp,
                            isHige: false,
                            isHoge: true)
                    }
                }
            }
        }
        
        table = (tableGenerator?.getArray2DDataCells())!
        
        if(table.colCount()>0 && table.rowCount()>0)
        {
            for col in 1..<table.colCount()
            {
                for row in 1..<table.rowCount()
                {
                    if(table[col,row] != nil && table[col,row]>=0)
                    {
                        ViewController.saveDataCell(
                            table[0,row-1]!,
                            temperature: table[col, 0]!,
                            weight: table[col,row]!,
                            lookUpTable: lookUp,
                            isHige: false,
                            isHoge: false)
                    }
                }
            }
        }
        
        return lookUp
        
    }

}
