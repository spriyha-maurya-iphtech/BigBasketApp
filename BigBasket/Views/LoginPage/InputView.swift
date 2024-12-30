//
//  InputView.swift
//  LoginLogout
//
//  Created by iPHTech34 on 20/11/24.
//

import SwiftUI

struct InputView: View {
    let placeholder: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 12) {
            if isSecureField {
                SecureField(placeholder, text: $text)
            }else {
                TextField(placeholder, text: $text)
            }
            
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(
               placeholder: "Email or Phone number",
               text: .constant("")
           )
    }
    
}
