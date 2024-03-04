//
//  ContentView.swift
//  TestNavigation
//
//  Created by MD Tanvir Shaharia on 23/2/24.
//

import SwiftUI

@available(iOS 16.0, *)
public struct MainView: View {
    var contracts: [Contracts] = [
            .init(name: "Tanvir", number: "01644566945", imgName: "tanvir", color: Color(.blue)),
            .init(name: "Albullah", number: "01644566945", imgName: "tushar", color: Color(.green)),
            .init(name: "GM Kader", number: "01644566945", imgName: "GM", color: Color(.orange)),
            .init(name: "Tahir", number: "01644566945", imgName: "tahir", color: Color(.gray)),
            .init(name: "Tanjid", number: "01644566945", imgName: "robin 2", color: Color(.purple)),
            .init(name: "Tushar", number: "01644566945", imgName: "robin 1", color: Color(.red)),
            .init(name: "Robin", number: "01644566945", imgName: "tanjid", color: Color(.brown)),
            .init(name: "Ashikur", number: "01644566945", imgName: "ashikur", color: Color(.magenta)),
            .init(name: "Faruk", number: "01644566945", imgName: "robin", color: Color(.brown))]
   public var body: some View {
        NavigationStack{
            List{
                Section("list of contract"){
                    ForEach(contracts, id: \.name){ contract in
                        NavigationLink(value: contract) {
                            Label(contract.name,systemImage: "person")
                                .foregroundColor(contract.color)
                        }
                    }
                }
            }
            .navigationTitle("Contracts")
            .navigationDestination(for: Contracts.self) { contract in
                ZStack{
                    contract.color.ignoresSafeArea()
                    VStack{
                        Image(contract.imgName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150,height: 150)
                            .background(Color(uiColor: .gray))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(Color(.white), lineWidth: 4)
                            }
                        Text(contract.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .padding(3)
                        Text(contract.number)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        HStack{
                            Button {
                                makePhoneCall(phoneNumber: contract.number)
                            } label: {
                                Image(systemName: "phone.down.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding()
                            }

                            Button {
                                print("clicked")
                            } label: {
                                Image(systemName: "bolt.horizontal.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            
                        }
                    }
                }
            }
        }
    }
   public func makePhoneCall(phoneNumber:String) {
        guard let phoneURL = URL(string: "tel://+88\(phoneNumber)"),
              UIApplication.shared.canOpenURL(phoneURL) else {
            // Handle error or show an alert if the device cannot make a phone call
            print("Unable to initiate phone call.")
            return
        }
        
        UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
    }
}

@available(iOS 13.0, *)
public struct Contracts : Hashable{
    var name : String
    var number : String
    var imgName : String
    var color : Color
}
