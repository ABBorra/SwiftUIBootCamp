//
//  PaddingBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/3/23.
//
/**
 
 background(
    Color.white
        .cornerRadius(5.0)
        .shadow(
            color: Color.blue.opacity(0.4),
            radius: 5,
            x: 0.0, y: 0.0
        )
        
 )
*/

import SwiftUI

struct PaddingBootCamp: View {
    var body: some View {
        NavigationView {
            List {
                    ForEach (0..<100, id: \.self) { index in
                        VStack(alignment: .leading) {
                            
                            Image("img")
                                .frame(maxWidth: .infinity, maxHeight: 150)
                               
                                .scaledToFit()
                                .cornerRadius(5.0)
                            
                            Text("Hello World...")
                                .font(.title2)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                //.padding()
                            
                            Text("“Don’t just tell me you’re going to change. Do it! Actions speak louder than words.”")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                                .shadow(radius: 10)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("List Items ")
        }
        
    }
}

struct PaddingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBootCamp()
    }
}
