//
//  CalculatorView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI

struct CalculatorView: View {
    @State var username: String = ""
      @State var isPrivate: Bool = true
      @State var notificationsEnabled: Bool = false
      @State private var previewIndex = 0
      var previewOptions = ["Always", "When Unlocked", "Never"]
    
    @State private var showingPopover = false
    
    var body: some View {
        Form {
            
           Section() {
               HStack{
                   TextField("Username", text: $username)
                   Button(action: {showingPopover = true}) {
                       Image(systemName: "info.circle")
    
                     }
                     .popover(isPresented: $showingPopover) {
                         Text("Explan Natural Gas")
                             .font(.headline)
                             .padding()
                         Text("Natural Gas Assumption")
                     }
               }
               Toggle(isOn: $isPrivate) {
                   Text("Private Account")
               }
           } header : {
               Text("Natural Gas")
           }
            footer : {
               Text("Explain Home Energy")
           }
           
            Section(header: Text("NOTIFICATIONS"), footer: Text("Explain Home Energy")) {
               Toggle(isOn: $notificationsEnabled) {
                   Text("Enabled")
               }
               Picker(selection: $previewIndex, label: Text("Show Previews")) {
                   ForEach(0 ..< previewOptions.count) {
                       Text(self.previewOptions[$0])
                   }
               }
           }
           
           Section(header: Text("ABOUT")) {
               HStack {
                   Text("Version")
                   Spacer()
                   Text("2.2.1")
               }
           }
           
           Section {
               Button(action: {
                   print("Perform an action here...")
               }) {
                   Text("Reset All Settings")
               }
           }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
