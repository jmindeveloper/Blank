//
//  Constant.swift
//  Blank
//
//  Created by J_Min on 2023/03/25.
//

import SwiftUI

struct Constant {
    static var rootVC: UIViewController? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.windows.first?.rootViewController
        } else {
            return UIApplication.shared.windows.first?.rootViewController
        }
    }
}
