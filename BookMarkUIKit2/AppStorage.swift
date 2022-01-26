//
//  AppStorage.swift
//  BookMarkUIKit2
//
//  Created by Yerkebulan Sharipov on 26.01.2022.
//

import Foundation

class Storage {
    @AppDataStorage (key: "link_models", defaultValue: [])
    static var linkModels: [LinkModel]
    
    @AppDataStorage(key: "show_onboarding", defaultValue: true)
        static var showOnboarding: Bool
}
@propertyWrapper
struct AppDataStorage <T: Codable> {
    private let key : String
    private let defaultValue: T
    init(key: String, defaultValue: T){
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue : T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else  {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data) 
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

