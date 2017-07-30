//
//  AssemblyStrongBox.swift
//  iBlades
//
//  Created by Bartleby on 17.02.17.
//  Copyright © 2017 i-Blades. All rights reserved.
//

import Foundation

protocol StrongBox: class {
    var strongBoxHolder: [String : AnyObject] { set get }
}

extension StrongBox {
    func strongBox<T>(_ configure: () -> T) -> T {
        let key = ObjectKey(T.self).key
        if let object = self.strongBoxHolder[key] {
            return object as! T
        }
        let object = configure()
        strongBoxHolder[key] = object as AnyObject
        return object
    }
}
