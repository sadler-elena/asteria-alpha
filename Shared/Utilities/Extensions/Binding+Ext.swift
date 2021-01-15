//
//  Binding+Ext.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/11/21.
//

import SwiftUI

extension Binding {
    static func mock(_ value: Value) -> Self {
        var value = value
        return Binding(get: { value }, set: { value = $0 })
    }
}
