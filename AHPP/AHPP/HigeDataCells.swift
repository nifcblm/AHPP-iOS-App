//
//  HigeDataCells.swift
//  AHPP
//
//  Created by Ben Neely on 4/9/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import CoreData

@objc(HigeDataCells)

class HigeDataCells: NSManagedObject {

    @NSManaged var temperature: NSNumber
    @NSManaged var pressure: NSNumber
    @NSManaged var weight: NSNumber
    @NSManaged var lookUpTable: LookUpTable

}
