//
//  LookUpTable.swift
//  AHPP
//
//  Created by Ben Neely on 4/9/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import CoreData

@objc(LookUpTable)

public class LookUpTable: NSManagedObject {

    @NSManaged public var company_name: String
    @NSManaged public var contact_number: String
    @NSManaged public var designated_base: String
    @NSManaged public var fixed_weight_reduduction: NSNumber
    @NSManaged public var flight_crew_weight: NSNumber
    @NSManaged public var gross_weight_limitation_hige: NSNumber
    @NSManaged public var gross_weight_limitation_hoge: NSNumber
    @NSManaged public var gross_weight_limitation_hoge_j: NSNumber
    @NSManaged public var helicopter_equipped_weight: NSNumber
    @NSManaged public var is_hoge: NSNumber
    @NSManaged public var make_model: String
    @NSManaged public var n_number: String
    @NSManaged public var performance_reference_hige: String
    @NSManaged public var performance_reference_hoge: String
    @NSManaged public var pilot_name: String
    @NSManaged public var has_wat: Bool
    @NSManaged public var watDataCells: NSSet
    @NSManaged public var higeDataCells: NSSet
    @NSManaged public var hogeDataCells: NSSet

}
