//
//  ContentView.swift
//  WallpaperApp
//
//  Created by Shohjahon Rakhmatov on 16/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnboardingFinished") var isOnboardingFinished = false
    
    var body: some View {
        if isOnboardingFinished {
            
        } else {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
