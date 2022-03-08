//
//  UserDefaultsHelper.swift
//  AniLog
//
//  Created by USER on 17/02/2022.
//

import Foundation

final class UserDefaultsHelper {
    
    enum UserDefaultKeys: String, CaseIterable {
        case theme
        case themeSyncWithSystem
    }
    
    static func setData<T>(value: T, key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }

    static func removeData(key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
}
