//
//  StringExtensions.swift
//  Storm Viewer
//
//  Created by Kriti on 2023-09-28.
//

import Foundation

extension String {
    func getId(replace: String, with: String, length: Int) -> String{
        return String(self.replacingOccurrences(of: replace, with: with).suffix(length))
    }
}
