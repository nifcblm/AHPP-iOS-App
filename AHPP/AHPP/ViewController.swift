//
//  ViewController.swift
//  AHPP
//
//  Created by andrew on 3/15/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    class func saveLookUpTable(company_name: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = appDelegate.managedObjectContext!

        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LookUpTable", inManagedObjectContext: context) as LookUpTable
        
        newItem.company_name = "ACME"
        
        println(newItem)

//
//        let entity =  NSEntityDescription.entityForName("LookUpTable",
//            inManagedObjectContext:
//            managedContext)
//        
//        let lookuptable = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext:managedContext)
//        
//        //3
//        person.setValue(company_name, forKey: "company_name")
//        
//        //4
//        var error: NSError?
//        if !managedContext.save(&error) {
//            println("Could not save \(error), \(error?.userInfo)")
//        }  
//        //5
//        entity.append(lookuptable)


    }
    

}

