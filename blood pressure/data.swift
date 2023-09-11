//
//  data.swift
//  blood pressure
//
//  Created by 林秀謙 on 2023/9/1.
//

import Foundation
import UIKit
import CoreData

class BloodPressureController {
    static let shared = BloodPressureController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "BloodPressure")//與xcdatamodel同名
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: {(storeDescription, error
        ) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
//這是存取Core Data模型和管理內部資料庫的資料的所需程式碼
