//
//  HogeDataCells.swift
//  AHPP
//
//  Created by Ben Neely on 4/9/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation
import CoreData

@objc(HogeDataCells)

class HogeDataCells: NSManagedObject {

    @NSManaged var pressure: NSNumber
    @NSManaged var weight: NSNumber
    @NSManaged var temperature: NSNumber
    @NSManaged var lookUpTable: LookUpTable

}
