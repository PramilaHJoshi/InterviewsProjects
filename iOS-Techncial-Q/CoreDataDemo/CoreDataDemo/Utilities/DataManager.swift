//
//  DataManager.swift
//  CoreDataDemo
//
//  Created by Pradeep Kumar Yeligandla on 09/09/24.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() { }
    
    lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data Stack: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
    
    func saveUser(username: String, password: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: context) else { return }
        let user = NSManagedObject(entity: entity, insertInto: context)
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        
        do {
            try context.save()
        } catch {
            print("Failed to save user: \(error)")
        }
    }
    
    
    func fetchUser(username: String) -> UseModel? {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "UserEntity")
        request.predicate = NSPredicate(format: "username == %@", username)
        
        do {
            let result = try context.fetch(request)
            if let user =  result.first, let fetchUsername = user.value(forKey: "username") as? String, let password = user.value(forKey: "password") as? String {
                return UseModel(username: fetchUsername, password: password)
            }
            
        } catch {
            print("Failed to fetch user: \(error)")
        }
        
        return nil
    }
    
    func getPersistentStorePath() -> String? {
        guard let storeDescription = persistanceContainer.persistentStoreDescriptions.first else {
            return nil
        }
        if let url = storeDescription.url {
            return url.path
        } else {
            return nil
        }
    }

//    // Example usage:
//    if let path = getPersistentStorePath() {
//        print("Core Data SQLite store path: \(path)")
//    }
        
        
}
