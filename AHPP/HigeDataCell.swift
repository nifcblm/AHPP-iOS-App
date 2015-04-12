//
//  HigeDataCell.swift
//  AHPP
//
//  Created by Ben Neely on 4/9/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import CoreData

@objc(HigeDataCell)

public class HigeDataCell: NSManagedObject {

    @NSManaged public var pressure: NSNumber
    @NSManaged public var temperature: NSNumber
    @NSManaged public var weight: NSNumber
    @NSManaged public var lookUpTable: LookUpTable

}
