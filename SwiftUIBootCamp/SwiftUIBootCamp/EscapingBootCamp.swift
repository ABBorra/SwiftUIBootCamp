//
//  ContentView.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/3/23.
//

import SwiftUI


class EscapingViewModel: ObservableObject {
    
    @Published var updatingText = "Helloooo.."
    
    func getData() {
        //      downloadData4 { [weak self] retunData in
        //          self?.updatingText = retunData
        //        }
        
        downloadData4 { [weak self] returnResult in
            self?.updatingText = returnResult.name ?? ""
        }
        
    }
    
    func downloadData(completion: (_ data: String) -> Void) {
        completion("World , Im waiting....")
    }
    
    func downloadData2(completion: (_ data: String) -> Void) {
        
        completion("World....")
        
    }
    
    func downloadData3(completion:@escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            completion("World....")
        })
    }
    
    func downloadData4(completion:@escaping downloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let Resultname = DownloadResultModel(name: "World....", job: "IT")
            completion(Resultname)
        })
    }
}

struct DownloadResultModel {
    let name : String?
    let job : String?
}

typealias downloadCompletion = (DownloadResultModel) -> ()
struct EscapingBootCamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        VStack {
            
            Text(vm.updatingText)
                .background(content: {
                    Color.orange
                        .frame(minWidth: 300, maxWidth: .infinity, maxHeight: 200)
                    
                })
            
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.red)
                .onTapGesture {
                    vm.getData()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootCamp()
    }
}
