//
//  ScrollViewReaderBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/6/23.
//

import SwiftUI

struct ScrollViewReaderBootCamp: View {
    
    @State var textFiledText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Enter your Index", text: $textFiledText)
                    .padding(.horizontal)
                    .font(.title2)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .shadow(radius: 5)
                    .border(Color.blue)
                    .padding(.horizontal)
                    .keyboardType(.namePhonePad)
                
                Button("Scroll to Index") {
                    withAnimation(.spring()) {
                        if let index = Int(textFiledText) {
                            scrollToIndex = index
                        }
                    }
                }
                
                
                ScrollView  {
                    ScrollViewReader { proxy in
                        ForEach(0..<100) { index in
                            Text("This is My Index \(index)")
                                .font(.headline)
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(50)
                                .shadow(radius: 10)
                                .padding()
                                .id(index)
                        }
                        .onChange(of: scrollToIndex, perform: { Newindex in
                            withAnimation(.spring()) {
                                proxy.scrollTo(Newindex, anchor: .top)
                            }
                        })
                    }
                }
            }
            .navigationTitle("Scroll Reader")
        }
        
    }
}

struct ScrollViewReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootCamp()
    }
}
