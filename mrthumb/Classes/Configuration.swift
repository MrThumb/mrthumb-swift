//
//  Configuration.swift
//  Pods
//
//  Created by Martín Fernández on 11/28/16.
//
//

import Foundation

public struct Configuration {
    let accessId: String
    let secretId: String

    public init(accessId: String, secretId: String) {
        self.accessId = accessId
        self.secretId = secretId
    }
}
