//
//  ArrayBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/6/23.
//

import SwiftUI
struct userModel: Identifiable {
    var id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModoifierViewModel: ObservableObject {
    @Published var dataArray: [userModel] = []
    @Published var filterArray: [userModel] = []
    @Published var mapArray: [String] = []
    
    init() {
       getUser()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        
        // Sort

        //        filterArray = dataArray.sorted { (user1, user2) -> Bool  in
        //            return user1.points > user2.points
        //        }
        
        filterArray = dataArray.sorted(by: { $0.points < $1.points  })
       
        
        
        /* fileter */
      //  filterArray = dataArray.filter({ $0.isVerified })
        
        /*Map*/
        
//        mapArray = dataArray.map({ (user) -> String in
//            return user.name ?? "No Name"
//        })
//        mapArray = dataArray.map({ $0.name ?? "No Name"})
        
        /* Compact Map*/
//        mapArray = dataArray.compactMap({ $0.name})
//
        mapArray = dataArray
            .sorted(by:  { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({$0.name})
        
    }
    
    //Array manipilation
    func getUser(){
        let user1 = userModel(name: "Bhargav", points: 100, isVerified: true)
        let user2 = userModel(name: "Bh", points: 6, isVerified: true)
        let user3 = userModel(name: nil, points: 78, isVerified: false)
        let user4 = userModel(name: "Bharg", points: 34, isVerified: true)
        let user5 = userModel(name: "Hello", points: 6, isVerified: true)
        let user6 = userModel(name: "linm", points: 34, isVerified: true)
        let user7 = userModel(name: nil, points: 66, isVerified: false)
        let user8 = userModel(name: "Dammy", points: 88, isVerified: true)
        let user9 = userModel(name: "Funny", points: 22, isVerified: true)
        let user10 = userModel(name: "Chinni", points: 09, isVerified: true)
        dataArray.append(contentsOf: [user1,
                                      user2,
                                      user3,
                                      user4,
                                      user5,
                                      user6,
                                      user7,
                                      user8,
                                      user9,
                                      user10])
    }
    
}


struct ArrayBootCamp: View {
    let vm = ArrayModoifierViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    
                    ForEach(vm.filterArray) { item in
                        VStack (alignment: .leading){
                            Text("\(item.name ?? "No Name")")
                                .font(.headline)
                            Spacer()
                            HStack {
                                Text("points: \(item.points)")
                                Spacer()
                                if item.isVerified {
                                    Image(systemName:"flame.fill")
                                }

                            }
                        }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.red.cornerRadius(5))
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Higher order Func")
            .font(.title3)
            
        }
        
    }
}

struct ArrayBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ArrayBootCamp()
    }
}
