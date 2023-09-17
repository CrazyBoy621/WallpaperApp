//
//  HomeView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 17/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedIndex = 0
    @State private var visibleIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                HeaderView()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 47) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                NavigationLink {
                                    CollectionView()
                                } label: {
                                    WallpaperCardView(title: "Ventura Series", count: 4, image: "peakpx")
                                        .frame(width: 200, height: 300)
                                }
                                NavigationLink {
                                    CollectionView()
                                } label: {
                                    WallpaperCardView(title: "Ventura Series", count: 4, image: "peakpx (1)")
                                        .frame(width: 200, height: 300)
                                }
                                NavigationLink {
                                    CollectionView()
                                } label: {
                                    WallpaperCardView(title: "Ventura Series", count: 4, image: "peakpx")
                                        .frame(width: 200, height: 300)
                                }
                                NavigationLink {
                                    CollectionView()
                                } label: {
                                    WallpaperCardView(title: "Ventura Series", count: 4, image: "peakpx (1)")
                                        .frame(width: 200, height: 300)
                                }
                            }
                            .padding(.vertical, 1)
                            .padding(.horizontal, 30)
                        }
                        VStack(spacing: 12) {
                            Text("Latest Series".uppercased())
                                .font(.sfProDisplay(size: 17).width(.compressed))
                                .bold()
                                .foregroundColor(.white.opacity(0.7))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Grid {
                                GridRow {
                                    WallpaperCardView(title: "Venture Series", count: 4, image: "peakpx")
                                        .frame(height: 200)
                                    WallpaperCardView(title: "Venture Series", count: 4, image: "peakpx")
                                        .frame(height: 200)
                                }
                                GridRow {
                                    WallpaperCardView(title: "Venture Series", count: 4, image: "peakpx (1)")
                                        .frame(height: 200)
                                        .gridCellColumns(2)
                                }
                                GridRow {
                                    WallpaperCardView(title: "Venture Series", count: 4, image: "peakpx")
                                        .frame(height: 200)
                                    WallpaperCardView(title: "Venture Series", count: 4, image: "peakpx")
                                        .frame(height: 200)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                    .padding(.top, 24)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.homeBackgroundColor.ignoresSafeArea())
        }
    }
    
    @ViewBuilder func HeaderView() -> some View {
        HStack {
            Text("Wallpapers")
                .font(.sfProDisplay(size: 34, weight: .bold).width(.expanded))
            Spacer()
            Button {
                
            } label: {
                IconView(systemName: "person")
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 11)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
