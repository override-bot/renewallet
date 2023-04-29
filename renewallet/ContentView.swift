//
//  ContentView.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/28/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var name = "Be";
    func changeName() -> Void{
        name = "Ada";
    }
    var body: some View {
        NavigationView{
            ZStack{
                Color(.white)
                VStack(spacing:10){
                    Spacer()
                    Image("intro")
                        .renderingMode(.original)
                        .resizable()
                        .frame(
                            width: UIScreen.screenWidth/1.1,
                            height:  UIScreen.screenHeight/3)
                    
                    CustomText(
                        data: "\(name) better with money.", fontSize: 40, color: Color("purple"),
                        fontWeight: .bold
                    ).padding(.leading, 25)
                    
                    
                    CustomText(
                        data:"Rene wallet is here to make financial transactions easier for you.", fontSize: 20, color: Color("purpleGrey"),
                        fontWeight: .regular
                    ).padding(.leading, 25)
                    Spacer()
                    
                    NavigationLink{
                        LoginView()
                    }label: {
                        Text("Get started")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        
                            .frame(width: UIScreen.screenWidth/1.5, height: 50)
                            .background(Color("purple"))
                            .cornerRadius(10)
                            .padding(.top, 10)
                        
                        
                    }
                }
            }
        }
    }
}
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
