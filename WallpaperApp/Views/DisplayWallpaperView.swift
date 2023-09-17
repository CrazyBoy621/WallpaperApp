//
//  DisplayWallpaperView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 17/09/23.
//

import SwiftUI
import Photos

struct DisplayWallpaperView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let collection: CardModel
    let index: Int
    @State var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 56) {
            VStack {
                Text("\(generateATitle(collection.title)) #\(selectedIndex + 1)")
                    .font(.sfProDisplay(size: 24, weight: .bold).width(.expanded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 150, height: 1)
                    .background(.white.opacity(0.1))
                Text("\(selectedIndex + 1) of \(collection.photos.count) Wallpaper\(collection.photos.count > 1 ? "s" : "")".uppercased())
                    .font(.sfProDisplay(size: 13, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.5))
            }
            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    TypeCellView("Mobile", isActive: true)
                    TypeCellView("Tablet", isActive: false)
                    TypeCellView("Desktop", isActive: false)
                }
                TabView(selection: $selectedIndex) {
                    ForEach(0..<collection.photos.count, id: \.self) { index in
                            Image(collection.photos[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 265, height: 525)
                                .cornerRadius(20)
                                .tag(index)
                                .overlay(
                                    SetButtonView {
                                        saveToPhotoLibrary(image: UIImage(named: collection.photos[index])!) { error in
                                            if let error = error {
                                                // Handle the error (e.g., show an alert)
                                                print("Error saving photo: \(error.localizedDescription)")
                                            } else {
                                                // Photo saved successfully (you can show a success message)
                                                print("Photo saved to library.")
                                            }
                                        }
                                    }
                                    , alignment: .bottom
                                )
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear {
                    selectedIndex = index
                }
            }
        }
        .padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.homeBackgroundColor)
        .navigationBarBackButtonHidden()
        .overlay(
            Button {
                dismiss()
            } label: {
                IconView(systemName: "arrow.backward")
            }
                .padding(.leading, 30)
                .padding(.top, 8)
            , alignment: .topLeading
        )
    }
    
    @ViewBuilder func TypeCellView(_ title: String, isActive: Bool) -> some View {
        Text(title.uppercased())
            .font(.sfProDisplay(size: 17, weight: .bold).width(.compressed))
            .padding(.horizontal, 17)
            .padding(.vertical, 7)
            .background( isActive ?
                         RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(colors: [Color.clear, Color.white.opacity(0.25)], startPoint: .top, endPoint: .bottom)
                ) : nil
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        LinearGradient(colors: [Color.white.opacity(0.21), Color.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            )
    }
    
    @ViewBuilder func SetButtonView(_ action: @escaping () -> Void) -> some View {
        Button (action: action) {
            Text("Save to Library")
                .foregroundStyle(
                    LinearGradient(colors: [Color.white, Color.white.opacity(0.7)], startPoint: .top, endPoint: .bottom))
                .font(.sfProDisplay(size: 17, weight: .medium))
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(.regularMaterial)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(
                            LinearGradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                )
        }
        .padding(.bottom, 28)
    }
    
    func generateATitle(_ text: String) -> String {
        return String(text.split(separator: " ")[0])
    }
    
    func saveToPhotoLibrary(image: UIImage, completion: @escaping (Error?) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                PHPhotoLibrary.shared().performChanges {
                    let creationRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                    creationRequest.creationDate = Date() // You can set the creation date if needed
                } completionHandler: { success, error in
                    if success {
                        completion(nil) // Photo saved successfully
                    } else {
                        completion(error) // There was an error saving the photo
                    }
                }
            } else {
                completion(nil) // Authorization denied or restricted
            }
        }
    }
}

struct DisplayWallpaperView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayWallpaperView(collection: CardModel(
            title: "iPhone 14 Series",
            photos: [
                "iphone14_1",
                "iphone14_2",
                "iphone14_3",
                "iphone14_4"
            ],
            date: Date(),
            description: "4K, 8K"), index: 0)
        .preferredColorScheme(.dark)
    }
}
