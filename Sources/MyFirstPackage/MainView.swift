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
    public var body: some View {
        VStack{
            Text("Package is now working")
                .padding()
                .font(.title)
                .foregroundColor(.blue)
            Text("Package is now working number 2")
                .padding()
                .font(.title)
                .foregroundColor(.blue)
            Image("GM")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width: 100, height: 100)
            
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

