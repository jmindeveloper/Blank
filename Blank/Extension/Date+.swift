//
//  Date+.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import Foundation

extension Date {
    /// yyyy년 mm월 dd일
    func date2yyyyMMdd() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        
        return formatter.string(from: self)
    }
}
