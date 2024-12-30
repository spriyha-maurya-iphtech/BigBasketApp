//
//  CapsuleButtonStyle.swift
//  LoginLogout
//
//  Created by iPHTech34 on 20/11/24.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    var bgColor: Color = .green
    var textColor: Color = .white
    var hasBorder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .overlay {
                hasBorder ?
                Capsule()
                    .stroke(.gray,lineWidth: 1) :
                nil
            }
    }
}
