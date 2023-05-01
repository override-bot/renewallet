//
//  Signup_view.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/30/23.
//

import SwiftUI

struct Signup_view: View {
    @StateObject var userViewmodel = UserViewmodel()
    @State private var email = ""
    @State private var password = ""
    
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
                    data:"Please enter your details to create your Renewallet account", fontSize: 20, color: Color("purpleGrey"),
                    fontWeight: .regular
                ).padding(.leading, 25)
                
                
                VStack{
                    CustomText(data: "Email:", fontSize: 20, color: Color("purpleGrey"), fontWeight: .medium)
                        .padding(.leading, 25)
                    
                    TextField("", text: $email)
                        .foregroundColor(Color("purpleGrey"))
                    
                        .frame(width: UIScreen.screenWidth,height: 50)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 10))
                }.frame(width: UIScreen.screenWidth)
                
                VStack{
                    CustomText(data: "Password:", fontSize: 20, color: Color("purpleGrey"), fontWeight: .medium)
                        .padding(.leading, 25)
                    
                    SecureField("", text: $password)
                        .foregroundColor(Color("purpleGrey"))
                    
                        .frame(width: UIScreen.screenWidth,height: 50)
                        .textFieldStyle(.roundedBorder)
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 10))
                }.frame(width: UIScreen.screenWidth)
                Button{
                    
                    userViewmodel.signUp(email:email, password:password)
                    print(userViewmodel.errorMessage as Any)
                    print(userViewmodel.user as Any)
                    
                    
                }label: {
                    Text("Get started")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    
                        .frame(width: UIScreen.screenWidth/1.5, height: 50)
                        .background(Color("purple"))
                        .cornerRadius(10)
                        .padding(.top, 10)
                    
                    
                    
                }
               
                    Spacer()
                 }
            }.navigationBarBackButtonHidden()
            .alert(isPresented:$userViewmodel.isError ){
                Alert(title: Text("Error"), message: Text(userViewmodel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}
struct Signup_view_Previews: PreviewProvider {
    static var previews: some View {
        Signup_view()
    }
}
