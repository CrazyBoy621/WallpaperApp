//
//  PaginationIndicatorView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

struct PaginationIndicatorView: View {
    var body: some View {
        HStack(spacing: 24) {
            Circle()
                .fill(Color.white)
                .frame(width: 6)
                .background(Background())
            Circle()
                .fill(Color.white.opacity(0.3))
                .frame(width: 6)
            Circle()
                .fill(Color.white.opacity(0.3))
                .frame(width: 6)
        }
    }
    
    @ViewBuilder func Background() -> some View {
        Circle()
            .stroke(Color.white.opacity(0.1))
            .frame(width: 30, height: 30)
            .overlay(
                Circle()
                    .stroke(Color.white.opacity(0.5))
                    .frame(width: 14, height: 14)
            )
    }
}

struct PaginationIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PaginationIndicatorView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}
