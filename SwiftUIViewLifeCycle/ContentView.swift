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

struct ModalView: View {
    @Binding var name: String
    
    var body: some View {
        Text("Halo, \(name)")
    }
}

#Preview{
    ContentView()
}

struct FirstView: View {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, \(name)!")
                NavigationLink("Go to next page") {
                   ZStackExample()
                }
            }
            .onAppear{
                print("Masuk pak eko")
            }
            .onDisappear{
                print("byeee")
        }
        }
        
    }
    
}


#Preview {
    FirstView(name: "Aloi")
}

struct ZStackExample: View {
    var body: some View {
        ZStack {
            // Blue background occupying the entire screen
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Hello,")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("ZStack!")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            // Red circle positioned at the center of the ZStack
            Circle()
                .foregroundColor(.red)
                .frame(width: 150, height: 150)
            
            // Green rectangle overlaid on top-left corner
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                .offset(x: -150, y: -300)
        }
    }
}

#Preview{
    ZStackExample()
}
