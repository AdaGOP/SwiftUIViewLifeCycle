//
//  ContentView.swift
//  SwiftUIViewLifeCycle
//
//  Created by khoirunnisa' rizky noor fatimah on 12/05/24.
//

import SwiftUI

struct ContentView: View {
    // STEP 1: Add @State variable for name
    var name: String = "Khoi"
    @State var isPresented: Bool = false
    @State var startDate = Date.now
    @State private var timerRunning = true
    @State private var timeElapsed = 0
    
    @State var color: Color = Color.yellow
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            ZStack {
                color.edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, \(name)!")
                    NavigationLink("Navigate") {
                        ModalView()
                    }
                    Button("Present") {
                        isPresented.toggle()
                    }
                    
                    Text("Timer: \(timeElapsed) sec")
                        .font(.title)
                        .padding()
                    // STEP 4: Add modifier to update text from timer
                    /// Your code will be here
                       
                    
                }
                .padding()
            }
            // STEP 7: Change the color when the timeElapsed change
            /// Your code will be here

            
            .onAppear {
                // STEP 6: Restart the timer when appearing this view
                /// Your code will be here
            }
            .onDisappear {
                // STEP 3: Change the name into Viona when the view is disappearing
                /// Your code will be here
               
                // STEP 5: Stop the timer when navigate to another page
                /// Your code will be here
            
            }
            .sheet(isPresented: $isPresented, content: {
                ModalView()
            })
        }
    }
    
}

#Preview{
    ContentView()
}
