//
//  OnboardingView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            HeaderView()
            Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                GridRow {
                    CardView(title: "up to 8k resolution", description: "From huge monitors to the phone, your wallpaper will look great anywhere.")
                        .rotationEffect(Angle(degrees: -5))
                    CardView(title: "commercial license", description: "These colorful abstract wallpapers are designed to fit nicely in an interface.")
                        .rotationEffect(Angle(degrees: 15))
                }
                GridRow() {
                    CardView(title: "3D Source Files", description: "3D is infinitely customizable. Get access to the Spline file to modify the zoom, angle and materials. You don’t need to be an expert in 3D!")
                        .gridCellColumns(2)
                }
            }
            Spacer()
            PaginationIndicatorView()
        }
        .overlay(
            NavigationLink {
                HomeView()
            } label: {
                NextButtonView()
            }
                .padding(.bottom, -28)
            , alignment: .bottomTrailing
        )
        .padding(.bottom, 22)
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 30)
        .background(BackgroundView())
    }
    
    @ViewBuilder func NextButtonView() -> some View {
        HexagonShape()
            .fill(
                LinearGradient(
                    colors: [Color.nextButtonColor1, Color.nextButtonColor2],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 64, height: 64)
            .foregroundStyle(
                .shadow(
                    .inner(color: Color.white.opacity(0.25), radius: 0, x: 1, y: 1)
                )
            )
            .foregroundStyle(
                .shadow(
                    .inner(color: Color.white.opacity(0.05), radius: 4, x: 0, y: -4)
                )
            )
            .overlay(
                HexagonShape()
                    .stroke(Color.black)
            )
            .overlay(
                Image(systemName: "arrow.right")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            )
            .shadow(color: Color.black.opacity(0.5), radius: 30, y: 30)
    }
    
    @ViewBuilder func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            ProductLaunchDateView()
            Text("Abstract 8K wallpapers for your designs")
                .font(.sfProDisplay(size: 34).width(.expanded))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder func ProductLaunchDateView() -> some View {
        HStack(spacing: 20) {
            Text("Product launch!")
                .font(.sfProDisplay(size: 13))
            Text("2023-09-16")
                .font(.sfProDisplay(size: 13))
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(13)
                )
        }
        .padding(.leading)
        .padding(4)
        .background(ProductLaunchBackground())
    }
    
    @ViewBuilder func BackgroundView() -> some View {
        Image("OnboardingBackground")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
    }
    
    @ViewBuilder func ProductLaunchBackground() -> some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(
                LinearGradient(colors: [Color.white.opacity(0.1), Color.white.opacity(0.05)], startPoint: .top, endPoint: .bottom)
            )
            .background(.ultraThickMaterial)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(LinearGradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0)], startPoint: .top, endPoint: .bottom))
            )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
    }
}
