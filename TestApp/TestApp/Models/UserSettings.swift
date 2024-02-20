//
//  UserSettings.swift
//  TestApp
//
//  Created by Artur Avdeev on 08.02.2024.
//

import Foundation

final class UserSettings {
    private enum SettingsKeys: String {
        case userName
        case age
        case gender
    }
    
    static var username: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.userName.rawValue
            if let userName = newValue {
                print("value: \(userName) was added to key \(key)")
                defaults.set(userName, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
                print("value: name was removed to key \(key)")
            }
        }
    }
    
    static var age: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.age.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.age.rawValue
            if let age = newValue {
                print("value: \(age) was added to key \(key)")
                defaults.set(age, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
                print("value: age was removed to key \(key)")
            }
        }
    }
    
    static var gender: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingsKeys.gender.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.gender.rawValue
            if let gender = newValue {
                print("value: \(gender) was added to key \(key)")
                defaults.set(gender, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
                print("value: gender was removed to key \(key)")
            }
        }
    }
}
