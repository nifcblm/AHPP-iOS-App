//
//  ViewController.swift
//  AHPP
//
//  Created by andrew on 3/15/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController{
    
    var myArray = [String]()
    var newCalculateValue = ""
    var calculateType = ""
    var currentInputValues = ["0","1","2","3"]
    var newDepartureAltitudeValue = ""
    var newDepartureTemperatureValue = ""
    var departureFuelWeightTotalInt = 1400 as Int
    var destinationFuelWeightTotalInt = 1400 as Int


    /* --------------------- BEGINNING OF LABELS --------------------- */
    
    /*--------------- misc labels on top -----------------*/
    @IBOutlet weak var pilotName: UILabel!
    @IBOutlet weak var helicopterModel: UILabel!
    @IBOutlet weak var helicopterNumber: UILabel!
    @IBOutlet weak var missionDate: UITextField!
    @IBOutlet weak var missionTime: UITextField!
    @IBOutlet weak var mission: UITextField!
    
    /*--------------- row 1 & 2 -----------------*/
    @IBOutlet weak var departureLocation: UITextField!
    @IBOutlet weak var destinationLocation: UITextField!
    @IBOutlet weak var departurePA: UIButton!
    @IBOutlet weak var departureTemperature: UIButton!
    @IBOutlet weak var destinationPA: UIButton!
    @IBOutlet weak var destinationTemperature: UIButton!
    
    /*----------------- row 3 & 4 ---------------*/
    @IBOutlet weak var helicopterEquiptWeight: UILabel!
    @IBOutlet weak var flightCrewWeight: UILabel!
    
    /*------------- row 5 --------------*/
    @IBOutlet weak var fuelWeightPoundsPerGallon: UILabel!
    @IBOutlet weak var fuelWeightDestination: UILabel!
    @IBOutlet weak var fuelWeightDeparture: UILabel!
    @IBOutlet weak var departureFuelTotal: UIButton!
    @IBOutlet weak var destinationFuelTotal: UIButton!

    
    /*------------------ row 6 ----------------*/
    @IBOutlet weak var operatingWeightDeparture: UILabel!
    @IBOutlet weak var operatingWeightDestination: UILabel!
    
    /*-------------------- rows 7a - 13 --------------------*/
    //departure labels
    @IBOutlet weak var computerGrossWeightHIGE: UILabel!
    @IBOutlet weak var computerGrossWeightHOGE: UILabel!
    @IBOutlet weak var computedGrossWeightHOGEJ: UILabel!
    @IBOutlet weak var weightReductionHIGE: UILabel!
    @IBOutlet weak var weightReductionHOGE: UILabel!
    @IBOutlet weak var weightReductionHOGEJ: UILabel!
    @IBOutlet weak var adjustedWeightHIGE: UILabel!
    @IBOutlet weak var adjustedWeightHOGE: UILabel!
    @IBOutlet weak var adjustedWeightHOGEJ: UILabel!
    @IBOutlet weak var grossWeightLimitationHIGE: UILabel!
    @IBOutlet weak var grossWeightLimitationHOGE: UILabel!
    @IBOutlet weak var grossWeightLimitationHOGEJ: UILabel!
    @IBOutlet weak var selectedWeightHIGE: UILabel!
    @IBOutlet weak var selectedWeightHOGE: UILabel!
    @IBOutlet weak var selectedWeightHOGEJ: UILabel!
    @IBOutlet weak var operatingWeightHIGE: UILabel!
    @IBOutlet weak var operatingWeightHOGE: UILabel!
    @IBOutlet weak var operatingWeightHOGEJ: UILabel!
    @IBOutlet weak var allowablePayloadHIGE: UILabel!
    @IBOutlet weak var allowablePayloadHOGE: UILabel!
    @IBOutlet weak var allowablePayloadHOGEJ: UILabel!
    @IBOutlet weak var exceedsHIGE: UILabel!
    @IBOutlet weak var exceedsHOGE: UILabel!
    @IBOutlet weak var exceedsHOGEJ: UILabel!
    
    //destination labels
    @IBOutlet weak var destinationComputedGrossWeightHIGE: UILabel!
    @IBOutlet weak var destinationComputedGrossWeightHOGE: UILabel!
    @IBOutlet weak var destinationComputedGrossWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationWeightReductionHIGE: UILabel!
    @IBOutlet weak var destinationWeightReductionHOGE: UILabel!
    @IBOutlet weak var destinationWeightReductionHOGEJ: UILabel!
    @IBOutlet weak var destinationadjustedWeightHIGE: UILabel!
    @IBOutlet weak var destinationAdjustedWeightHOGE: UILabel!
    @IBOutlet weak var destinationAdjustedWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationGrossWeightLimitationHIGE: UILabel!
    @IBOutlet weak var destinationGrossWeightLimitiationHOGE: UILabel!
    @IBOutlet weak var destinationGrossWeightLimitiationHOGEJ: UILabel!
    @IBOutlet weak var destinationSelectedWeightHIGE: UILabel!
    @IBOutlet weak var destinationSelectedWeightHOGE: UILabel!
    @IBOutlet weak var destinationSelectedWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationOperatingWeightHIGE: UILabel!
    @IBOutlet weak var destinationOperatingWeightHOGE: UILabel!
    @IBOutlet weak var destinationOperatingWeightHOGEJ: UILabel!
    @IBOutlet weak var destinationAllowablePayloadHIGE: UILabel!
    @IBOutlet weak var destinationAllowablePayloadHOGE: UILabel!
    @IBOutlet weak var destinationAllowablePayloadHOGEJ: UILabel!
    @IBOutlet weak var destinationExceedsHIGE: UILabel!
    @IBOutlet weak var destinationExceedsHOGE: UILabel!
    @IBOutlet weak var destinationExceedsHOGEJ: UILabel!
    /* --------------------- END OF LABELS --------------------- */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        parse()
        
        departurePA.setTitle(currentInputValues[0], forState: UIControlState.Normal)
        departureTemperature.setTitle(currentInputValues[1], forState: UIControlState.Normal)
        destinationPA.setTitle(currentInputValues[2], forState: UIControlState.Normal)
        destinationTemperature.setTitle(currentInputValues[3], forState: UIControlState.Normal)
        departureFuelTotal.setTitle(String(departureFuelWeightTotalInt) , forState: UIControlState.Normal)
        destinationFuelTotal.setTitle(String(destinationFuelWeightTotalInt) , forState: UIControlState.Normal)
        fuelWeightPoundsPerGallon.text = "7"
        
//        // Test pilot information
//        var savedLUT = ViewController.saveLookUpTable(
//            "ACME INC",
//            contact_number: "208-999-9999",
//            designated_base: "Podunk ID",
//            fixed_weight_reduduction: 400,
//            flight_crew_weight: 200,
//            gross_weight_limitation_hige: 300,
//            gross_weight_limitation_hoge: 100,
//            gross_weight_limitation_hoge_j: 200,
//            helicopter_equipped_weight: 100,
//            is_hoge: 50,
//            make_model: "Apache",
//            n_number: "4",
//            performance_reference_hige: "Great",
//            performance_reference_hoge: "So Great",
//            pilot_name: "John Smith",
//            has_wat: false)
//        
//        // Save the test pilot
//        ViewController.saveDataCell(40, temperature: 80, weight: 50, lookUpTable: savedLUT, isHige: false, isHoge: true)
        
        // Helicopter object
        var helicopter = getMyHelo();
        
        if ((helicopter) != nil) {
            var realHelicopter = helicopter as LookUpTable!
            // Will set name to "John Smith"
            pilotName.text = realHelicopter.pilot_name
            helicopterModel.text = realHelicopter.make_model
            helicopterNumber.text = realHelicopter.n_number
            
            // NSInt to NSString example
            //line 3
            helicopterEquiptWeight.text = realHelicopter.helicopter_equipped_weight.stringValue
            //line 4
            flightCrewWeight.text = realHelicopter.flight_crew_weight.stringValue
            
            //line 10
            grossWeightLimitationHIGE.text = realHelicopter.gross_weight_limitation_hige.stringValue
            grossWeightLimitationHOGE.text = realHelicopter.gross_weight_limitation_hoge.stringValue
            grossWeightLimitationHOGEJ.text = realHelicopter.gross_weight_limitation_hoge_j.stringValue
            
            destinationGrossWeightLimitationHIGE.text = realHelicopter.gross_weight_limitation_hige.stringValue
            destinationGrossWeightLimitiationHOGE.text = realHelicopter.gross_weight_limitation_hoge.stringValue
            destinationGrossWeightLimitiationHOGEJ.text = realHelicopter.gross_weight_limitation_hoge_j.stringValue
            
            fuelWeightDeparture.text = String(format:"%.1f", Double(departureFuelWeightTotalInt) / 7.0)
            fuelWeightDestination.text = String(format:"%.1f", Double(destinationFuelWeightTotalInt) / 7.0)
  
            setOperatingWeight()
            setComputedGrossWeight()

        }
        
    }
    
    func setOperatingWeight(){
        operatingWeightDeparture.text = String(operatingWeight(departureFuelWeightTotalInt))
        operatingWeightDestination.text = String(operatingWeight(destinationFuelWeightTotalInt))
    }

    func setComputedGrossWeight(){
        
        var currentDeparturePressure = currentInputValues[0]
        var currentDepartureTemperature = currentInputValues[1]
        
        computerGrossWeightHIGE.text = String(getHigeWeight(currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!).integerValue)
        computerGrossWeightHOGE.text = String(getHogeWeight(currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!).integerValue)
        computedGrossWeightHOGEJ.text = String(getHogeWeight(currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!).integerValue)
        
        var currentDestinationPressure = currentInputValues[2]
        var currentDestinationTemperature = currentInputValues[3]
        
        destinationComputedGrossWeightHIGE.text = String(getHigeWeight(currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!).integerValue)
        destinationComputedGrossWeightHOGE.text = String(getHogeWeight(currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!).integerValue)
        destinationComputedGrossWeightHOGEJ.text = String(getHogeWeight(currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!).integerValue)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getHigeWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let lookUpTables = context.executeFetchRequest(fetchRequest, error: nil) as [LookUpTable]
        let lookUpTable : LookUpTable = lookUpTables.first!
        
        var weight: NSNumber = 0
        
        var higeDataCells : NSSet = lookUpTable.higeDataCells
        
        for item in higeDataCells.allObjects as [HigeDataCell] {
            
            if (item.pressure == pressure && item.temperature == temperature) {
                weight = item.weight
            }
        }
        return weight
    }
    
    func getHogeWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let lookUpTables = context.executeFetchRequest(fetchRequest, error: nil) as [LookUpTable]
        let lookUpTable = lookUpTables.first!
        
        var weight : NSNumber = 0
        
        var hogeDataCells : NSSet = lookUpTable.hogeDataCells
        
        for item in hogeDataCells.allObjects as [HogeDataCell] {
            if (item.pressure == pressure && item.temperature == temperature) {
                weight = item.weight
            }
        }
        return weight
    }
    
    func getWatWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let lookUpTables = context.executeFetchRequest(fetchRequest, error: nil) as [LookUpTable]
        let lookUpTable = lookUpTables.first!
        
        var weight : NSNumber = 0
        
        var watDataCells : NSSet = lookUpTable.watDataCells
        
        for item in watDataCells.allObjects as [WatDataCell] {
            if (item.pressure == pressure && item.temperature == temperature) {
                weight = item.weight
            }
        }
        return weight
    }
    
    func operatingWeight(fuelWeight: NSInteger) -> NSInteger {
        let myHelo = getMyHelo() as LookUpTable!
        return myHelo.helicopter_equipped_weight.integerValue + myHelo.flight_crew_weight.integerValue + fuelWeight
    }
    
    func adjustedWeight(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSNumber, temperature: NSNumber) -> NSInteger {
        let myHelo = getMyHelo() as LookUpTable!

        if isHogeJ {
            return getHogeWeight(pressure, temperature: temperature) as NSInteger
        } else if isHoge {
            return getHogeWeight(pressure, temperature: temperature).integerValue - myHelo.fixed_weight_reduduction.integerValue
        }
        else {
            return getHigeWeight(pressure, temperature: temperature).integerValue - myHelo.fixed_weight_reduduction.integerValue
        }
    }
    
    
    func grossWeightLimitation(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSNumber, temperature:NSNumber) -> NSInteger {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let lookUpTables = context.executeFetchRequest(fetchRequest, error: nil) as [LookUpTable]
        let lookUpTable = lookUpTables.first!
        var myhelo = getMyHelo()
        
        var weight : NSInteger = 0
        if isHige {
            weight = lookUpTable.gross_weight_limitation_hige as NSInteger
        } else if isHoge{
            weight = lookUpTable.gross_weight_limitation_hoge as NSInteger

        }else if isHogeJ{
            weight = lookUpTable.gross_weight_limitation_hoge_j as NSInteger
        }
        
        if lookUpTable.has_wat {
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
    
    func selectedWeight(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSNumber, temperature: NSNumber) -> NSInteger {
        let adjustedWeightValue = adjustedWeight(isHige, isHoge: isHoge, isHogeJ: isHogeJ, pressure: pressure, temperature: temperature)
        let grossWeightLimitationValue = grossWeightLimitation(isHige, isHoge: isHoge, isHogeJ: isHogeJ, pressure: pressure, temperature: temperature)
        
        if adjustedWeightValue < grossWeightLimitationValue {
              return adjustedWeightValue
        } else {
            return grossWeightLimitationValue
        }
    }
    
    func allowablePayload(isHige: Bool, isHoge: Bool, isHogeJ: Bool, pressure: NSNumber, temperature:   NSNumber, fuelWeight: NSInteger){
        operatingWeight(fuelWeight) - selectedWeight(isHige, isHoge: isHoge, isHogeJ: isHogeJ,  pressure: pressure, temperature: temperature)
    }
    
    func getPressures() -> [String] {
        let myHelo = getMyHelo() as LookUpTable!

        
        var pressures = [Int]()
        
        var higeDataCells = myHelo.higeDataCells
        
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
        
        println(pressureStrings.count)

        
        return pressureStrings
    }
    
    func getTemperatures() -> [String] {
        let myHelo = getMyHelo() as LookUpTable!
        
        
        var temperatures = [Int]()
        
        var higeDataCells = myHelo.higeDataCells
        
        for item in higeDataCells.allObjects {
            let temperature = item.temperature as NSInteger
            if !contains(temperatures, temperature) {
                temperatures.append(temperature)
            }
        }
        
        temperatures = sorted(temperatures)
        
        var temperatureStrings = [String]()
        for num in temperatures {
            println(num)
            temperatureStrings.append(String(num))
        }
        
        return temperatureStrings
    }

    func getMyHelo() -> LookUpTable? {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!

        
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let allHelos = context.executeFetchRequest(fetchRequest, error: nil) as [LookUpTable]
        
        if allHelos.count > 0 {
            return allHelos.first!
        } else {
            return nil
        }
    }
 
    @IBAction func departureAltitudeButtonClick(sender: AnyObject) {
        calculateType = "Departure Altitude"
        myArray = getPressures()
    }
    
    @IBAction func departureTemperatureClick(sender: AnyObject) {
        calculateType = "Departure Temperature"
        myArray = getTemperatures()
    }
    
    @IBAction func destinationAltitudeClick(sender: AnyObject) {
        calculateType = "Destination Altitude"
        myArray = getPressures()
    }
    
    @IBAction func destinationTemperatureClick(sender: AnyObject) {
        calculateType = "Destination Temperature"
        myArray = getTemperatures()
    }
    
    @IBAction func departureFuelTotalClick(sender: AnyObject) {
        calculateType = "Departure Fuel Weight"
        myArray = ["1000", "1100", "1200", "1300", "1400", "1500", "1600", "1700", "1800", "1900","2000"]
        
    }
    
    @IBAction func destinationFuelTotalClick(sender: AnyObject) {
        calculateType = "Destination Fuel Weight"
        myArray = ["1000", "1100", "1200", "1300", "1400", "1500", "1600", "1700", "1800", "1900","2000"]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : ScrollViewController = segue.destinationViewController as ScrollViewController
        
        DestViewController.labelText = calculateType
        DestViewController.secondCurrentInputValues = currentInputValues
        DestViewController.myArray = myArray
        DestViewController.destinationFuelWeightTotal = String(destinationFuelWeightTotalInt)
        DestViewController.departureFuelWeightTotal = String(departureFuelWeightTotalInt)
    }

    class func saveDataCell(
        pressure: NSNumber,
        temperature: NSNumber,
        weight: NSNumber,
        lookUpTable: LookUpTable,
        isHige: Bool,
        isHoge: Bool
        ) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!
        
            
            if isHige {
                let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("HigeDataCell", inManagedObjectContext: context) as HigeDataCell
                newDataCell.pressure = pressure
                newDataCell.temperature = temperature
                newDataCell.weight = weight
                newDataCell.lookUpTable = lookUpTable
                
//                println("Pressure:")
//                println(pressure)
//                println("Temperature:")
//                println(temperature)
                
            } else if isHoge {
                let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("HogeDataCell", inManagedObjectContext: context) as HogeDataCell
                newDataCell.pressure = pressure
                newDataCell.temperature = temperature
                newDataCell.weight = weight
                newDataCell.lookUpTable = lookUpTable
            } else {
                let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("WatDataCell", inManagedObjectContext: context) as WatDataCell
                newDataCell.pressure = pressure
                newDataCell.temperature = temperature
                newDataCell.weight = weight
                newDataCell.lookUpTable = lookUpTable
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
        pilot_name: String,
        has_wat: Bool) -> LookUpTable {
            
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
        newLookUpTable.has_wat = has_wat
        
        return newLookUpTable
    }
}

