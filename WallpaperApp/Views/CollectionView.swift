//
//  CollectionView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 17/09/23.
//

import SwiftUI

struct CollectionView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HeaderView()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack {
                        Text("Ventura Wallpapers \nSeries")
                            .font(.sfProDisplay(size: 24, weight: .bold).width(.expanded))
                        Spacer()
                        VStack(alignment: .trailing, spacing: 8) {
                            Text("16 Wallpapers".uppercased())
                                .font(.sfProDisplay(size: 17, weight: .bold).width(.compressed))
                                .foregroundColor(.white.opacity(0.7))
                            Text("4K, 8K")
                                .font(.sfProDisplay(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.5))
                            Text("3 jan 2023")
                                .font(.sfProDisplay(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                    Grid {
                        GridRow {
                            WallpaperCardView(title: "Venture #1", count: 4, image: "peakpx (1)")
                                .frame(height: 200)
                                .gridCellColumns(2)
                        }
                        GridRow {
                            WallpaperCardView(title: "Venture #2", count: 4, image: "peakpx")
                                .frame(height: 200)
                            WallpaperCardView(title: "Venture #3", count: 4, image: "peakpx")
                                .frame(height: 200)
                        }
                        GridRow {
                            WallpaperCardView(title: "Venture #4", count: 4, image: "peakpx (1)")
                                .frame(height: 200)
                                .gridCellColumns(2)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.homeBackgroundColor.ignoresSafeArea())
//        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder func HeaderView() -> some View {
        HStack {
            Button {
                dismiss()
            } label: {
                IconView(systemName: "arrow.backward")
            }
            Spacer()
            Button {

            } label: {
                IconView(systemName: "square.and.arrow.up")
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 8)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CollectionView()
                .preferredColorScheme(.dark)
        }
    }
}
