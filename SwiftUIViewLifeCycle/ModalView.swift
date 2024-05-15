//
//  ModalView.swift
//  SwiftUIViewLifeCycle
//
//  Created by khoirunnisa' rizky noor fatimah on 15/05/24.
//

import SwiftUI

struct ModalView: View {
    // STEP 2: Add @Binding var here
    var name: String = "Viona"
    
    var body: some View {
        Text("Halo, \(name)")
    }
}

#Preview {
    ModalView()
}
