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

    @NSManaged var company_name: String
    @NSManaged var contact_number: String
    @NSManaged var designated_base: String
    @NSManaged var fixed_weight_reduduction: NSNumber
    @NSManaged var flight_crew_weight: NSNumber
    @NSManaged var gross_weight_limitation_hige: NSNumber
    @NSManaged var gross_weight_limitation_hoge: NSNumber
    @NSManaged var gross_weight_limitation_hoge_j: NSNumber
    @NSManaged var helicopter_equipped_weight: NSNumber
    @NSManaged var is_hoge: NSNumber
    @NSManaged var make_model: String
    @NSManaged var n_number: String
    @NSManaged var performance_reference_hige: String
    @NSManaged var performance_reference_hoge: String
    @NSManaged var pilot_name: String
    @NSManaged var has_wat: Bool
    @NSManaged var watDataCells: NSSet
    @NSManaged var higeDataCells: NSSet
    @NSManaged var hogeDataCells: NSSet

}
