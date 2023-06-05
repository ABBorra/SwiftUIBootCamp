//
//  HashabaleBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/6/23.
//

import SwiftUI


struct customHashableModel: Hashable {
    //hasble is same as identifier
    let title: String
    let subTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title+subTitle)
    }
}

struct HashabaleBootCamp: View {
    let data: [customHashableModel] = [
        customHashableModel(title: "joo", subTitle: ""),
        customHashableModel(title: "heyan", subTitle: ""),
        customHashableModel(title: "Arha", subTitle: ""),
        customHashableModel(title: "Prahvi", subTitle: ""),
        
    ]
    
    var body: some View {
        ScrollView {
            ForEach(data, id: \.self) { item in
                Text(item.title)
            }
        }
    }
}

struct HashabaleBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        HashabaleBootCamp()
    }
}
