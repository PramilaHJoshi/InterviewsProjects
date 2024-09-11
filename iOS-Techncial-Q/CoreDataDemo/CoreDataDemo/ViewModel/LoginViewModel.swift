//
//  LoginViewModel.swift
//  CoreDataDemo
//
//  Created by Pradeep Kumar Yeligandla on 09/09/24.
//

import Foundation
protocol LoginViewModelProtocol {
    func login(username: String, password: String) -> Bool
    func saveUser(username: String, password: String)
    func getPersistentStorePath() -> String?
}

class LoginViewModel: LoginViewModelProtocol {
    let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func login(username: String, password: String) -> Bool {
        guard !username.isEmpty && !password.isEmpty else {
            return false
        }
        if let user = coreDataManager.fetchUser(username: username) {
            return user.password == password
        }
        return false
    }
    
    func saveUser(username: String, password: String) {
        coreDataManager.saveUser(username: username, password: password)
    }
    
    func getPersistentStorePath() -> String? {
        return coreDataManager.getPersistentStorePath()
    }
    
}
