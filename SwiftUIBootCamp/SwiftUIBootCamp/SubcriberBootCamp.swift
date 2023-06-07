//
//  SubcriberBootCamp.swift
//  SwiftUIBootCamp
//
//  Created by AB_Borra on 6/8/23.
//

import SwiftUI
import Combine
class SubscriberViewModel : ObservableObject {
    
    @Published var count: Int = 0
    @Published var textFiledtext = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false
    
    var cancelable = Set<AnyCancellable>()
    
    
    init() {
        setupTimer()
        self.addTextFiledSubscriber()
        self.addButtonSubsciber()
    }
    
    func setupTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self]_ in
                
                guard let self = self else { return }
                
                self.count += 1
//                if self.count >= 10 {
//                    for item in self.cancelable {
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancelable)
    }
    
    func addTextFiledSubscriber() {
        
        $textFiledtext
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
        // .assign(to: \.textIsValid, on: self)
            .sink(receiveValue: {[weak self] (isValid) in
                self?.textIsValid = isValid
            })
            .store(in: &cancelable)
    }
    
    func addButtonSubsciber() {
        $textIsValid
            .combineLatest($count)
            .sink {[weak self] isvalid, count in
                guard let self = self else {return}
                if isvalid && count >= 10 {
                    self.showButton = true
                }
                else {
                    self.showButton = false
                }
            }
            .store(in: &cancelable)
    }
    
   
}

struct SubcriberBootCamp: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            
            Text("\(vm.count)")
            
            Text("\(vm.textIsValid.description)")
                .foregroundColor(.green)
            
            TextField("Type something here ....", text: $vm.textFiledtext)
                .padding()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundColor(.red)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding()
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.red)
                        
                            .opacity(
                                vm.textFiledtext.count < 1 ? 0.0 :
                                    vm.textIsValid ? 0.0 : 1.0
                            )
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.green)
                            .opacity(
                                vm.textIsValid ? 1.0 : 0.0
                            )
                    }
                        .font(.title)
                        .padding(.trailing)
                        .padding()
                    ,alignment: .trailing
                )
            Button(action: {
                vm.count = 0
            }, label: {
                Text("Press".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .opacity(
                        vm.showButton ? 1.0 : 0.5
                    )
            })
            .disabled(!vm.showButton)
            .padding()
        }
        
    }
}

struct SubcriberBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SubcriberBootCamp()
    }
}
