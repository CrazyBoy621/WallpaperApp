//
//  Font+.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

extension Font {
    static func sfProDisplay(size: CGFloat, weight: UIFont.Weight = .regular) -> Font {
        var font = UIFont.systemFont(ofSize: size, weight: weight)
        let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor
        font = UIFont(descriptor: descriptor, size: size)
        return Font(font)
    }
}
