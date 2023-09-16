//
//  IconView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

struct IconView: View {
    
    let systemName: String
    
    var body: some View {
        HexagonShape()
            .fill(
                LinearGradient(
                    colors: [Color.white.opacity(0), Color.white.opacity(0.2)],
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .frame(width: 44, height: 44)
            .overlay(
                Image(systemName: systemName)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color.white, Color.white.opacity(0)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
            )
            .overlay(
                HexagonShape()
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.21), Color.white.opacity(0)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                    .frame(width: 44, height: 44)
            )
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(systemName: "aspectratio")
    }
}
