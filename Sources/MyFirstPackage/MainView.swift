//
//  ContentView.swift
//  TestNavigation
//
//  Created by MD Tanvir Shaharia on 23/2/24.
//

import SwiftUI

@available(macOS 11.0, *)
@available(iOS 16.0, *)
public struct MainView: View {
 public init() {}
    @State private var isFullScreen : Bool = false
    public var body: some View {
        ZStack{
            Color(.blue)
            VStack{
                Text("Package is now working")
                    .padding()
                    .font(.title)
                    .foregroundColor(.blue)
                Text("Package is now working number 2")
                    .padding()
                    .font(.title)
                    .foregroundColor(.blue)
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        isFullScreen.toggle()
                    }
                
            }
        }
        .fullScreenCover(isPresented: $isFullScreen) {
           Text("Another screen is working")
           Text("Exit")
                .font(.title2)
                .bold()
                .padding()
                .onTapGesture {
                    isFullScreen.toggle()
                }
        }
    }
}
@available(iOS 16.0, *)
@available(macOS 11.0, *)
struct MainView_Previews : PreviewProvider{
    static var previews: some View {
        MainView()
    }
}

