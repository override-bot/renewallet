//
//  login_view.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/29/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var userViewmodel = UserViewmodel()
    @State private var email = ""
    var body: some View {
        ZStack{
            Color(.white)
            VStack(spacing:10){
              
                Image("intro")
                    .renderingMode(.original)
                    .resizable()
                    .frame(
                        width: UIScreen.screenWidth/1.5,
                        height:  UIScreen.screenHeight/3.5)
                
                CustomText(
                    data: "Welcome\nto Renewallet!", fontSize: 30, color: Color("purple"),
                    fontWeight: .bold
                ).padding(.leading, 25)
                
                
                CustomText(
                    data:"Please enter your details to login to your Renewallet account", fontSize: 20, color: Color("purpleGrey"),
                    fontWeight: .regular
                ).padding(.leading, 25)
                
                
                HStack{
                    Text("Email:").foregroundColor(Color("purpleGrey"))
                    
                    TextField("wisdomzilla13@gmail.com", text: $email)
                        .foregroundColor(Color("purpleGrey"))
                        .padding(10)
                        .frame(height: 50)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                       
                        
                        
                        
                       
                }.frame(width: UIScreen.screenWidth)
                .padding(.leading, 25)
                Spacer()
            }
        }.navigationBarBackButtonHidden()
    }
    }


struct login_view_Previews: PreviewProvider {
    static var previews: some View {
       LoginView()
    }
}
