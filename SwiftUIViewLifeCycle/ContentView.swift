//
//  ContentView.swift
//  SwiftUIViewLifeCycle
//
//  Created by khoirunnisa' rizky noor fatimah on 12/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "Khoi"
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
                        ModalView(name: $name)
                    }
                    Button("Present") {
                        isPresented.toggle()
                    }
                    
                    Text("Timer: \(timeElapsed) sec")
                        .font(.title)
                        .padding()
                        .onReceive(timer, perform: { time in
                            timeElapsed = Int(time.timeIntervalSince(startDate))
                        })
                    
                }
                .padding()
            }
            .onChange(of: timeElapsed, { oldValue, newValue in
                color = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
            })
            .onAppear {
                startDate = Date.now
                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
            .onDisappear {
                name = "Viona"
                timer.upstream.connect().cancel()
            }
            .sheet(isPresented: $isPresented, content: {
                ModalView(name: $name)
            })
        }
    }
    
}

#Preview{
    ContentView()
}
