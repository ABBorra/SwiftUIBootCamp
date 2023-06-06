//
//  LazyVGridBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/6/23.
//

import SwiftUI

struct LazyVGridBootCamp: View {
    
    let layout = [
        GridItem(.flexible(maximum: 150)),
        GridItem(.flexible(maximum: 150)),
        GridItem(.flexible(maximum: 150)),
    ]
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: layout, spacing: 10) {
                        ForEach(0..<100, id: \.self) { index in
                            
                            VStack() {
                              Spacer()
                                Image(systemName:"flame.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.red)
                                Text("My index value: \(index)")
                                    .foregroundColor(.blue)

                                Spacer()
                            }
                           
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.yellow)
                            .frame(width: .infinity)
                            .frame(height: .infinity)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .background(Color.white)
                          
                                                                             
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationTitle("LazyVGrid")
        }
    }
}

struct LazyVGridBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridBootCamp()
    }
}
