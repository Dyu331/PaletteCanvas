//
//  Level5View.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/6/23.
//

import SwiftUI

struct Level5View: View {
    @Binding var rootActive:Bool
    @Binding var level5Completion:Bool
    @State var toResult:Bool=false
    @State var buttonColor=Color(.systemBlue)
    
    @State var user1=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user2=Color(red: 0.5, green: 0.5, blue: 0.5)
    @State var user3=Color(red: 0.5, green: 0.5, blue: 0.5)
    @Binding var toHelpView:Bool
    
    var body: some View {
        NavigationView{
            
            VStack{
                ZStack{
                    
                    NavigationLink(destination: ResultView(rootActive: $rootActive).navigationBarBackButtonHidden(true), isActive: $toResult, label: {EmptyView()})
                }
                    Text("Portrait of a Young Girl")
                        .font(.title)
                        .bold()
                    Image("level 5 painting with palette").resizable()
                        .scaledToFit().padding()
                HStack{
                    VStack{
                        Color(red: user1.components.red, green: user1.components.green, blue:user1.components.blue ).padding().frame(width: 100,height:100)
                        ColorPicker("",selection:$user1,supportsOpacity: false).labelsHidden()
                        
                    }
                    VStack{
                        Color(red: user2.components.red, green: user2.components.green, blue:user2.components.blue ).padding().frame(width: 100,height:100)
                        ColorPicker("",selection:$user2,supportsOpacity: false).labelsHidden()
                        
                    }
                    VStack{
                        Color(red: user3.components.red, green: user3.components.green, blue:user3.components.blue ).padding().frame(width: 100,height:100)
                        ColorPicker("",selection:$user3,supportsOpacity: false).labelsHidden()
                        
                    }
                    
                }
                Spacer()
                Spacer()
                Button("Check Color") {
                    // Button action
                     if (colorSetsSimilar3(level5List, [user1,user2,user3]))
                    {
                         level5Completion=true
                         toResult=true
                         resultText="You have completed level 5: Portrait of a Young Girl"
                         resultPalettes="palette 5"
                         resultDetail="This is an example of monochromatic colors. These are variations of a single color. This color scheme offers a sense of unity anf are often used to create a harmonious and calming effect in artwork."
                         
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
                    Help5View(backToLevel: $toHelpView,user1:$user1,user2:$user2,user3:$user3).background(ClearFullCoverBackground())
                }
                    
                
                
                
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

struct Level5View_Previews: PreviewProvider {
    static var previews: some View {
        Level5View(rootActive: .constant(false),level5Completion: .constant(false),toHelpView: .constant(false))
    }
}
