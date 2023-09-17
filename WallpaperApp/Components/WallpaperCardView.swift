//
//  WallpaperCardView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 17/09/23.
//

import SwiftUI

struct WallpaperCardView: View {
    
    let title: String
    let count: Int
    let image: String
    
    var body: some View {
        InformationView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(colors: [Color.white.opacity(0.3), Color.white.opacity(0)], startPoint: .bottomLeading, endPoint: .topTrailing))
            )
    }
    
    @ViewBuilder func InformationView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Image("CardLogo")
            Text(title)
                .font(.sfProDisplay(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            Text("\(count) Wallpaper\(count > 1 ? "s": "")".uppercased())
                .font(.sfProDisplay(size: 13, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(20)
    }
}

struct WallpaperCardView_Previews: PreviewProvider {
    static var previews: some View {
        WallpaperCardView(title: "iPhone 14 Series", count: 12, image: "peakpx")
            .preferredColorScheme(.dark)
    }
}
