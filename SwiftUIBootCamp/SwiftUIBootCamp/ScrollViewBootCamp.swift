//
//  ScrollViewBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/6/23.
//

import SwiftUI

struct ScrollViewBootCamp: View {
    var body: some View {
        ScrollView {
            ForEach(0..<100) { index in
                Text("This is my index \(index)")
                    .font(.headline)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(radius: 10)
                    .padding()
            }
        }
    }
}

struct ScrollViewBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootCamp()
    }
}
