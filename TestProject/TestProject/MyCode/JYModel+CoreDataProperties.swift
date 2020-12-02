//
//  JYModel+CoreDataProperties.swift
//  
//
//  Created by JackYoung on 2020/12/2.
//
//

import Foundation
import CoreData


extension JYModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JYModel> {
        return NSFetchRequest<JYModel>(entityName: "JYModel")
    }

    @NSManaged public var time: String?
    @NSManaged public var content: String?

}
