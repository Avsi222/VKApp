//
//  DatabaseService.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseService {
    
    static var configuration: Realm.Configuration {
        return Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    }
    
    @discardableResult
    static func saveToRealm<Element: Object>(items: [Element], config: Realm.Configuration = Realm.Configuration.defaultConfiguration, update: Bool = true) -> Realm? {
        
        do {
            let realm = try Realm(configuration: config)
            
            print(realm.configuration.fileURL ?? "")
            
            try realm.write {
                realm.add(items, update: update)
            }
            
            return realm
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    static func get<T: Object>(_ type: T.Type, in realm: Realm? = try? Realm(configuration: DatabaseService.configuration)) -> Results<T>? {
        return realm?.objects(type)
    }
}

