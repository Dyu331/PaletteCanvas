//
//  Level3View.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/6/23.
//

import SwiftUI

struct Level3View: View {
    @Binding var rootActive:Bool
    @Binding var level3Completion:Bool
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
                Text("The Scream")
                    .font(.title)
                    .bold()
                Image("level 3 painting with palette").resizable()
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
                Spacer()
                Spacer()
                Button("Check Color") {
                    // Button action
                     if (colorSetsSimilar4(level3List, [user1,user2,user3,user4]))
                    {
                         level3Completion=true
                         toResult=true
                         resultText="You have completed level 3: The Scream"
                         resultPalettes="palette 3"
                         resultDetail="This is an example of complimentary color, colors located on the opposite ends of the color wheel. They create a striking contrast when used together and can enhance each other's intensity."
                         
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
                    Help3View(backToLevel: $toHelpView,user1:$user1,user2:$user2,user3:$user3,user4:$user4).background(ClearFullCoverBackground())
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

struct Level3View_Previews: PreviewProvider {
    static var previews: some View {
        Level3View(rootActive:.constant(false),level3Completion: .constant(false), toHelpView: .constant(false))
    }
}
