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
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 4) {
            HeaderView()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 47) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(vm.wallpapers) { wallpaper in
                                NavigationLink {
                                    CollectionView(collection: wallpaper)
                                } label: {
                                    WallpaperCardView(title: wallpaper.title, count: wallpaper.photos.count, image: wallpaper.photos[0])
                                        .frame(width: 200, height: 300)
                                }
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
        .navigationBarHidden(true)
        .background(Color.homeBackgroundColor.ignoresSafeArea())
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

struct CardModel: Identifiable {
    let id = UUID()
    let title: String
    let photos: [String]
    let date: Date
    let description: String
}

class HomeViewModel: ObservableObject {
    var wallpapers: [CardModel] = []
    
    let iphone14: CardModel = CardModel(
        title: "iPhone 14 Series",
        photos: [
            "iphone14_1",
            "iphone14_2",
            "iphone14_3",
            "iphone14_4"
        ],
        date: Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 17)) ?? Date(),
        description: "4K, 8K")
    
    init() {
        wallpapers = [iphone14]
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
