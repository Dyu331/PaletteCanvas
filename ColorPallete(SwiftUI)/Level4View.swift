//
//  Level4View.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/6/23.
//

import SwiftUI

struct Level4View: View {
    @Binding var rootActive:Bool
    @Binding var level4Completion:Bool
    @State var toResult:Bool=false
    @State var buttonColor=Color(.systemBlue)
    
    @State var user1=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user2=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user3=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user4=Color(red: 0.5, green: 0.5, blue: 0.5)
    
    @Binding var toHelpView:Bool
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                ZStack{
                    
                    NavigationLink(destination: ResultView(rootActive: $rootActive).navigationBarBackButtonHidden(true), isActive: $toResult, label: {EmptyView()})
                }
                Spacer()
                Text("The Olive Trees")
                    .font(.title)
                    .bold()
                Image("level 4 painting with palette").resizable()
                    .scaledToFit().padding()
                HStack{
                    Spacer()
                    VStack{
                        Color(red: user1.components.red, green: user1.components.green, blue:user1.components.blue ).padding().frame(width: 90,height:90)
                        ColorPicker("",selection:$user1,supportsOpacity: false).labelsHidden()
                        
                    }
                    VStack{
                        Color(red: user2.components.red, green: user2.components.green, blue:user2.components.blue ).padding().frame(width: 90,height:90)
                        ColorPicker("",selection:$user2,supportsOpacity: false).labelsHidden()
                        
                    }
                    VStack{
                        Color(red: user3.components.red, green: user3.components.green, blue:user3.components.blue ).padding().frame(width: 90,height:90)
                        ColorPicker("",selection:$user3,supportsOpacity: false).labelsHidden()
                        
                    }
                    VStack{
                        Color(red: user4.components.red, green: user4.components.green, blue:user4.components.blue ).padding().frame(width: 90,height:90)
                        ColorPicker("",selection:$user4,supportsOpacity: false).labelsHidden()
                        
                    }
                    Spacer()
                    
                }.padding(.trailing).padding(.leading)
                
             Spacer()
              
                Button("Check Color") {
                    // Button action
                     if (colorSetsSimilar4(level4List, [user1,user2,user3,user4]))
                    {
                         level4Completion=true
                         toResult=true
                         resultText="You have completed level 4: The Olive Trees"
                         resultPalettes="palette 4"
                         resultDetail="This is an example of analogous colors, which are located right next to each other on the color wheel. These colors share similar undertones and create a harmonious and cohesive color palette. "
                         
                     }
                    else{
                        buttonColor=Color(.systemRed)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            buttonColor = Color(.systemBlue)
                                    }
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
                .background(buttonColor.opacity(0.8))
                .cornerRadius(10).bold().fullScreenCover(isPresented: $toHelpView) {
                    Help4View(backToLevel: $toHelpView,user1:$user1,user2:$user2,user3:$user3,user4:$user4).background(ClearFullCoverBackground())
                }
               Spacer()
                
            }.toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        toHelpView.toggle()
                    }) {
                        Image(systemName: "questionmark.circle").font(.system(size: 27))
                    }.frame(width:50)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        rootActive.toggle()
                            }) {
                                Image(systemName: "house").font(.system(size: 27))
                            }.frame(width:50)
                            }
            })
        }
    }
}

struct Level4View_Previews: PreviewProvider {
    static var previews: some View {
        Level4View(rootActive: .constant(false),level4Completion: .constant(false),toHelpView: .constant(false))
    }
}
