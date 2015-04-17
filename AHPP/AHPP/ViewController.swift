//
//  ViewController.swift
//  AHPP
//
//  Created by andrew on 3/15/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import UIKit
import CoreData

public class ViewController: UIViewController{
    var myArray = [String]()
    var newCalculateValue = ""
    var calculateType = ""
    var currentInputValues = ["6000","20","7000","25"]
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
    @IBOutlet weak var weightReductionTextField: UITextField!
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
    @IBOutlet weak var destinationWeightReductionTextField: UITextField!
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
    
    @IBOutlet weak var extraWeightTextField: UITextField!
    @IBOutlet weak var acualPayload: UILabel!
    
    /* --------------------- END OF LABELS --------------------- */
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        departurePA.setTitle(currentInputValues[0], forState: UIControlState.Normal)
        departureTemperature.setTitle(currentInputValues[1], forState: UIControlState.Normal)
        destinationPA.setTitle(currentInputValues[2], forState: UIControlState.Normal)
        destinationTemperature.setTitle(currentInputValues[3], forState: UIControlState.Normal)
        departureFuelTotal.setTitle(String(departureFuelWeightTotalInt) , forState: UIControlState.Normal)
        destinationFuelTotal.setTitle(String(destinationFuelWeightTotalInt) , forState: UIControlState.Normal)
        fuelWeightPoundsPerGallon.text = "7"
        
        var helicopter = getMyHelo();
    
        if (helicopter != nil) {
            var realHelicopter = helicopter as LookUpTable!
            pilotName.text = realHelicopter.pilot_name
            helicopterModel.text = realHelicopter.make_model
            helicopterNumber.text = realHelicopter.n_number
            helicopterEquiptWeight.text = realHelicopter.helicopter_equipped_weight.stringValue
            flightCrewWeight.text = realHelicopter.flight_crew_weight.stringValue
            fuelWeightDeparture.text = String(format:"%.1f", Double(departureFuelWeightTotalInt) / 7.0)
            fuelWeightDestination.text = String(format:"%.1f", Double(destinationFuelWeightTotalInt) / 7.0)
  
            setComputedGrossWeight()
            setWeightReduction()
            setGrossWeightLimitation()
            setAdjustedWeight()
            setSelectedWeight()
            setOperatingWeight()
            setAllowablePayload()
        }
    }

    func setGrossWeightLimitation(){
        var currentDeparturePressure = currentInputValues[0], currentDepartureTemperature = currentInputValues[1], currentDestinationPressure = currentInputValues[2], currentDestinationTemperature = currentInputValues[3]

        grossWeightLimitationHIGE.text = String(grossWeightLimitation(true, isHoge: false, isHogeJ: false, pressure: currentDeparturePressure.toInt()!, temperature: currentDepartureTemperature.toInt()!))
        grossWeightLimitationHOGE.text = String(grossWeightLimitation(false, isHoge: true, isHogeJ: false, pressure: currentDeparturePressure.toInt()!, temperature: currentDepartureTemperature.toInt()!))
        grossWeightLimitationHOGEJ.text = String(grossWeightLimitation(false, isHoge: false, isHogeJ: true, pressure: currentDeparturePressure.toInt()!, temperature: currentDepartureTemperature.toInt()!))
        destinationGrossWeightLimitationHIGE.text = String(grossWeightLimitation(true, isHoge: false, isHogeJ: false, pressure: currentDestinationPressure.toInt()!, temperature: currentDestinationTemperature.toInt()!))
        destinationGrossWeightLimitiationHOGE.text = String(grossWeightLimitation(false, isHoge: true, isHogeJ: false, pressure: currentDestinationPressure.toInt()!, temperature: currentDestinationTemperature.toInt()!))
        destinationGrossWeightLimitiationHOGEJ.text = String(grossWeightLimitation(false, isHoge: false, isHogeJ: true, pressure: currentDestinationPressure.toInt()!, temperature: currentDestinationTemperature.toInt()!))
    }
    
    func setOperatingWeight(){
        var departureOperatingWeight = String(operatingWeight(departureFuelWeightTotalInt)), destinationOperatingWeight = String(operatingWeight(destinationFuelWeightTotalInt))
        
        operatingWeightDeparture.text = departureOperatingWeight
        operatingWeightDestination.text = destinationOperatingWeight
        operatingWeightHIGE.text = departureOperatingWeight
        operatingWeightHOGE.text = departureOperatingWeight
        operatingWeightHOGEJ.text = departureOperatingWeight
        destinationOperatingWeightHIGE.text = destinationOperatingWeight
        destinationOperatingWeightHOGE.text = destinationOperatingWeight
        destinationOperatingWeightHOGEJ.text = destinationOperatingWeight
    }
    
    func setWeightReduction(){
        let helo = getMyHelo() as LookUpTable!
        weightReductionHIGE.text = helo.fixed_weight_reduduction.stringValue
        weightReductionHOGE.text = helo.fixed_weight_reduduction.stringValue
        destinationWeightReductionHIGE.text = helo.fixed_weight_reduduction.stringValue
        destinationWeightReductionHOGE.text = helo.fixed_weight_reduduction.stringValue
    }

    func setComputedGrossWeight(){
        var currentDeparturePressure = currentInputValues[0], currentDepartureTemperature = currentInputValues[1], currentDestinationPressure = currentInputValues[2], currentDestinationTemperature = currentInputValues[3]
        
        computerGrossWeightHIGE.text = String(getHigeWeight(currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!).integerValue)
        computerGrossWeightHOGE.text = String(getHogeWeight(currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!).integerValue)
        computedGrossWeightHOGEJ.text = String(getHogeWeight(currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!).integerValue)
        destinationComputedGrossWeightHIGE.text = String(getHigeWeight(currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!).integerValue)
        destinationComputedGrossWeightHOGE.text = String(getHogeWeight(currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!).integerValue)
        destinationComputedGrossWeightHOGEJ.text = String(getHogeWeight(currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!).integerValue)
    }
    
    func setAdjustedWeight(){
        var currentDeparturePressure = currentInputValues[0], currentDepartureTemperature = currentInputValues[1], currentDestinationPressure = currentInputValues[2], currentDestinationTemperature = currentInputValues[3]
        
        adjustedWeightHIGE.text = String(adjustedWeight(true, isHoge: false, isHogeJ: false, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, isDeparture: true))
        adjustedWeightHOGE.text = String(adjustedWeight(false, isHoge: true, isHogeJ: false, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, isDeparture: true))
        adjustedWeightHOGEJ.text = String(adjustedWeight(false, isHoge: false, isHogeJ: true, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, isDeparture: true))
        destinationadjustedWeightHIGE.text = String(adjustedWeight(true, isHoge: false, isHogeJ: false, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, isDeparture: true))
        destinationAdjustedWeightHOGE.text = String(adjustedWeight(false, isHoge: true, isHogeJ: false, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, isDeparture: true))
        destinationAdjustedWeightHOGEJ.text = String(adjustedWeight(false, isHoge: false, isHogeJ: true, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, isDeparture: true))
    }
    
    func setSelectedWeight(){
        var currentDeparturePressure = currentInputValues[0], currentDepartureTemperature = currentInputValues[1], currentDestinationPressure = currentInputValues[2], currentDestinationTemperature = currentInputValues[3]

        selectedWeightHIGE.text = String(selectedWeight(true, isHoge: false, isHogeJ: false, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, isDeparture: true))
        selectedWeightHOGE.text = String(selectedWeight(false, isHoge: true, isHogeJ: false, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, isDeparture: true))
        selectedWeightHOGEJ.text = String(selectedWeight(false, isHoge: false, isHogeJ: true, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, isDeparture: true))
        destinationSelectedWeightHIGE.text = String(selectedWeight(true, isHoge: false, isHogeJ: false, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, isDeparture: false))
        destinationSelectedWeightHOGE.text = String(selectedWeight(false, isHoge: true, isHogeJ: false, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, isDeparture: false))
        destinationSelectedWeightHOGEJ.text = String(selectedWeight(false, isHoge: false, isHogeJ: true, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, isDeparture: false))
    }
    
    func setAllowablePayload(){
        var currentDeparturePressure = currentInputValues[0], currentDepartureTemperature = currentInputValues[1], currentDestinationPressure = currentInputValues[2], currentDestinationTemperature = currentInputValues[3]

        allowablePayloadHIGE.text = String(allowablePayload(true, isHoge: false, isHogeJ: false, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, fuelWeight: departureFuelWeightTotalInt, isDeparture: true))
        allowablePayloadHOGE.text =  String(allowablePayload(false, isHoge: true, isHogeJ: false, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, fuelWeight: departureFuelWeightTotalInt, isDeparture: true))
        allowablePayloadHOGEJ.text =  String(allowablePayload(false, isHoge: false, isHogeJ: true, pressure: currentDeparturePressure.toInt()!,temperature: currentDepartureTemperature.toInt()!, fuelWeight: departureFuelWeightTotalInt, isDeparture: true))
        destinationAllowablePayloadHIGE.text = String(allowablePayload(true, isHoge: false, isHogeJ: false, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, fuelWeight: destinationFuelWeightTotalInt, isDeparture: false))
        destinationAllowablePayloadHOGE.text =  String(allowablePayload(false, isHoge: true, isHogeJ: false, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, fuelWeight: destinationFuelWeightTotalInt, isDeparture: false))
        destinationAllowablePayloadHOGEJ.text =  String(allowablePayload(false, isHoge: false, isHogeJ: true, pressure: currentDestinationPressure.toInt()!,temperature: currentDestinationTemperature.toInt()!, fuelWeight: destinationFuelWeightTotalInt, isDeparture: false))
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    public func getHigeWeight(pressure: NSNumber, temperature: NSNumber) -> NSNumber {
        let myHelo = getMyHelo() as LookUpTable!
        var weight: NSNumber = 0, higeDataCells : NSSet = myHelo.higeDataCells
        
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
                return getHogeWeight(pressure, temperature: temperature).integerValue - weightReductionTextField.text.toInt()!
            } else {
                return getHogeWeight(pressure, temperature: temperature).integerValue - destinationWeightReductionTextField.text.toInt()!

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

    func isAllowable(){
        acualPayload.text = extraWeightTextField.text
        
        if acualPayload.text?.toInt() < allowablePayloadHIGE.text?.toInt(){
            exceedsHIGE.text = "OK"
        }
        else{
            exceedsHIGE.text = "Exceeds"
        }
        
        if acualPayload.text?.toInt() < allowablePayloadHOGE.text?.toInt(){
            exceedsHOGE.text = "OK"
        }
        else{
            exceedsHOGE.text = "Exceeds"
        }
        
        if acualPayload.text?.toInt() < allowablePayloadHOGEJ.text?.toInt(){
            exceedsHOGEJ.text = "OK"
        }
        else{
            exceedsHOGEJ.text = "Exceeds"
        }

        if acualPayload.text?.toInt() < destinationAllowablePayloadHIGE.text?.toInt(){
            destinationExceedsHIGE.text = "OK"
        }
        else{
            destinationExceedsHIGE.text = "Exceeds"
        }
        
        if acualPayload.text?.toInt() < destinationAllowablePayloadHOGE.text?.toInt(){
            destinationExceedsHOGE.text = "OK"
        }
        else{
            destinationExceedsHOGE.text = "Exceeds"
        }
        
        if acualPayload.text?.toInt() < destinationAllowablePayloadHOGEJ.text?.toInt(){
            destinationExceedsHOGEJ.text = "OK"
        }
        else{
            destinationExceedsHOGEJ.text = "Exceeds"
        }
    }

   public  func getMyHelo() -> LookUpTable? {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "LookUpTable")
        let allHelos = context.executeFetchRequest(fetchRequest, error: nil) as! [LookUpTable]
        
        if allHelos.count > 0 {
            return allHelos.last!
        } else {
            return nil
        }
    }
    @IBAction func weightReductionTextChanged(sender: AnyObject) {
        setAdjustedWeight()
        setSelectedWeight()
        setAllowablePayload()
        isAllowable()
    }
    @IBAction func destinationWeightReductionTextChanged(sender: AnyObject) {
        setAdjustedWeight()
        setSelectedWeight()
        setAllowablePayload()
        isAllowable()
    }
 
    @IBAction func extraWeightTextChanged(sender: AnyObject) {
        isAllowable()
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
        myArray = ["0", "100", "200", "300", "400", "500", "600", "700", "800", "900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", "1700", "1800", "1900","2000"]
        
    }
    
    @IBAction func destinationFuelTotalClick(sender: AnyObject) {
        calculateType = "Destination Fuel Weight"
        myArray = ["0", "100", "200", "300", "400", "500", "600", "700", "800", "900", "1000", "1100", "1200", "1300", "1400", "1500", "1600", "1700", "1800", "1900","2000"]
    }
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : ScrollViewController = segue.destinationViewController as! ScrollViewController
        
        DestViewController.labelText = calculateType
        DestViewController.secondCurrentInputValues = currentInputValues
        DestViewController.myArray = myArray
        DestViewController.destinationFuelWeightTotal = String(destinationFuelWeightTotalInt)
        DestViewController.departureFuelWeightTotal = String(departureFuelWeightTotalInt)
    }

   public class func saveDataCell(pressure: NSNumber, temperature: NSNumber, weight: NSNumber, lookUpTable: LookUpTable, isHige: Bool, isHoge: Bool) {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext!
    
        
        if isHige {
            let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("HigeDataCell", inManagedObjectContext: context) as! HigeDataCell
            newDataCell.pressure = pressure
            newDataCell.temperature = temperature
            newDataCell.weight = weight
            newDataCell.lookUpTable = lookUpTable
            
        } else if isHoge {
            let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("HogeDataCell", inManagedObjectContext: context) as! HogeDataCell
            newDataCell.pressure = pressure
            newDataCell.temperature = temperature
            newDataCell.weight = weight
            newDataCell.lookUpTable = lookUpTable
        } else {
            let newDataCell = NSEntityDescription.insertNewObjectForEntityForName("WatDataCell", inManagedObjectContext: context) as! WatDataCell
            newDataCell.pressure = pressure
            newDataCell.temperature = temperature
            newDataCell.weight = weight
            newDataCell.lookUpTable = lookUpTable
        }
    }
    
    public class func saveLookUpTable(company_name: String, contact_number: String, designated_base: String, fixed_weight_reduduction: NSNumber, flight_crew_weight: NSNumber, gross_weight_limitation_hige: NSNumber, gross_weight_limitation_hoge: NSNumber, gross_weight_limitation_hoge_j: NSNumber,helicopter_equipped_weight: NSNumber, is_hoge: NSNumber, make_model: String, n_number: String, performance_reference_hige: String, performance_reference_hoge: String, pilot_name: String, has_wat: Bool) -> LookUpTable {
            
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext!
        let newLookUpTable = NSEntityDescription.insertNewObjectForEntityForName("LookUpTable", inManagedObjectContext: context) as! LookUpTable
        
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
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        dispatch_async(dispatch_get_main_queue(), {
            UIAlertView(title: "Export Successful", message: "The AHPP sheet has been exported to your Camera Roll successfully", delegate: nil, cancelButtonTitle: "Close").show()
        })
    }
    
    func screenShotMethod() {
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
    }
    
    @IBAction func ExportButtonClicked(sender: UIButton) {
        screenShotMethod();
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
}
