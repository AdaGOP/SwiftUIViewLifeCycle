//
//  ModalView.swift
//  SwiftUIViewLifeCycle
//
//  Created by khoirunnisa' rizky noor fatimah on 15/05/24.
//

import SwiftUI

struct ModalView: View {
    @Binding var name: String
    
    var body: some View {
        Text("Halo, \(name)")
    }
}

#Preview {
    ModalView(name: .constant("Viona"))
}
