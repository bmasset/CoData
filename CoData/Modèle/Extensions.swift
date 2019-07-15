//
//  Extensions.swift
//  CoData
//
//  Created by B Masset on 12/07/2019.
//  Copyright © 2019 B Masset. All rights reserved.
//

import Foundation

extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
