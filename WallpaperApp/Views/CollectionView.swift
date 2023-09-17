//
//  CollectionView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 17/09/23.
//

import SwiftUI

struct CollectionView: View {
    
    @Environment(\.dismiss) private var dismiss
    let collection: CardModel
    
    var body: some View {
        VStack {
            HeaderView()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack {
                        Text(collection.title)
                            .font(.sfProDisplay(size: 24, weight: .bold).width(.expanded))
                        Spacer()
                        VStack(alignment: .trailing, spacing: 8) {
                            Text("\(collection.photos.count) Wallpaper\(collection.photos.count > 1 ? "s": "")".uppercased())
                                .font(.sfProDisplay(size: 17, weight: .bold).width(.compressed))
                                .foregroundColor(.white.opacity(0.7))
                            Text(collection.description)
                                .font(.sfProDisplay(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.5))
                            Text(formatDate(date: collection.date))
                                .font(.sfProDisplay(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                    Grid {
                        ForEach(0..<collection.photos.count, id: \.self) { index in
                            if index % 3 == 0 {
                                GridRow {
                                    NavigationLink {
                                        DisplayWallpaperView(collection: collection, index: index)
                                    } label: {
                                        WallpaperCardView(title: "\(generateATitle(collection.title)) #\(index + 1)", count: 4, image: collection.photos[index])
                                            .frame(height: 200)
                                    }
                                    .gridCellColumns(2)
                                }
                            } else {
                                GridRow {
                                    if index % 3 == 1 {
                                        NavigationLink {
                                            DisplayWallpaperView(collection: collection, index: index)
                                        } label: {
                                            WallpaperCardView(title: "\(generateATitle(collection.title)) #\(index + 1)", count: 4, image: collection.photos[index])
                                                .frame(height: 200)
                                        }
                                    }
                                    if index + 1 % 3 == 2 {
                                        NavigationLink {
                                            DisplayWallpaperView(collection: collection, index: index + 1)
                                        } label: {
                                            WallpaperCardView(title: "\(generateATitle(collection.title)) #\(index + 2)", count: 4, image: collection.photos[index + 1])
                                                .frame(height: 200)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.homeBackgroundColor.ignoresSafeArea())
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
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func generateATitle(_ text: String) -> String {
        return String(text.split(separator: " ")[0])
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CollectionView(collection: CardModel(
                title: "iPhone 14 Series",
                photos: [
                    "iphone14_1",
                    "iphone14_2",
                    "iphone14_3",
                    "iphone14_4"
                ],
                date: Date(),
                description: "4K, 8K"))
            .preferredColorScheme(.dark)
        }
    }
}
