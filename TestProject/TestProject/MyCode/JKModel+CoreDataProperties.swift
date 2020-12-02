//
//  JKModel+CoreDataProperties.swift
//  
//
//  Created by JackYoung on 2020/12/2.
//
//

import Foundation
import CoreData


extension JKModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JKModel> {
        return NSFetchRequest<JKModel>(entityName: "JKModel")
    }

    @NSManaged public var time: String?
    @NSManaged public var content: String?

}
