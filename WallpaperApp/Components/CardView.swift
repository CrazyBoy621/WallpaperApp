//
//  CardView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

struct CardView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 12) {
            IconView(systemName: "aspectratio")
            VStack(spacing: 4) {
                Text(title.uppercased())
                    .font(.title3.width(.condensed)).bold()
                    .multilineTextAlignment(.center)
                    .layoutPriority(1)
                Text(description)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .opacity(0.7)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
        .padding(.horizontal)
        .padding(.bottom, 14)
        .background(Color.black.cornerRadius(30))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "up to 8k resolution", description: "From huge monitors to the phone, your wallpaper will look great anywhere.")
    }
}
