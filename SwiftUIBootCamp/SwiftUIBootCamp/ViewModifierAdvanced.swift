//
//  ViewModifierAdvanced.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/15/23.
//

import SwiftUI

struct DefaultViewModifier: ViewModifier {
    var backGroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(backGroundColor)
            .cornerRadius(10)
            .shadow(radius: 5)
            
    }
}

extension View {
    func withDefaultViewModifier(backgroundColour: Color = .blue) -> some View {
        modifier(DefaultViewModifier(backGroundColor: backgroundColour))
            
    }
}
struct ViewModifierAdvanced: View {
    var body: some View {
       
        VStack (spacing: 10) {
          
            Text("Hello!...")
                .font(.title)
                .withDefaultViewModifier(backgroundColour: .orange)
               
            
            Text("My text here!...")
                .font(.title3)
                .foregroundColor(.blue)
                .withDefaultViewModifier(backgroundColour: .white)
                
                
            
            Text("Im available...")
                .font(.title2)
                .withDefaultViewModifier(backgroundColour: .green)
           Spacer()
           
        }
        .padding(.top, 90)
        .padding()
        .background(.yellow)
        .ignoresSafeArea()
        
      
    }
   
}

struct ViewModifierAdvanced_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierAdvanced()
    }
}
