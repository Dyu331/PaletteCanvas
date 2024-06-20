//
//  PalletesView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/4/23.
//

import SwiftUI

struct PalettesView: View {

    
    @Binding var level1Completed:Bool
    @Binding var level2Completed:Bool
    @Binding var level3Completed:Bool
    @Binding var level4Completed:Bool
    @Binding var level5Completed:Bool
    
    @Binding var rootActive:Bool
    
    @State private var toDetailView:Bool=false
    
    
    var level1Palette:String{
        if level1Completed
        {
            return "palette 1"
        }
        else{
            return "lock"
        }
    }
    var level2Palette:String{
        if level2Completed
        {
            return "palette 2"
        }
        else{
            return "lock"
        }
    }
    var level3Palette:String{
        if level3Completed
        {
            return "palette 3"
        }
        else{
            return "lock"
        }
    }
    var level4Palette:String{
        if level4Completed
        {
            return "palette 4"
        }
        else{
            return "lock"
        }
    }
    var level5Palette:String{
        if level5Completed
        {
            return "palette 5"
        }
        else{
            return "lock"
        }
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                NavigationLink(destination: PalettesDetailView(), isActive: $toDetailView, label:{ EmptyView()})
                
                Text("Unlocked Palettes")
                    .font(.title)
                    .padding().bold().navigationBarBackButtonHidden(false)
                //level 1 palette
                Button(action: {
                    paletteColorList=[color1_1,color1_2,color1_3]
                    toDetailView.toggle()
                }) {
                    Image(level1Palette)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 75)
                }.padding().disabled(level1Palette=="lock")
                
                //level 2 palette
                Button(action: {
                    paletteColorList=[color2_1,color2_2,color2_3]
                    toDetailView.toggle()

                }) {
                    Image(level2Palette)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 75)
                }.padding().disabled(level2Palette=="lock")
                
                //level 3 palette
                Button(action: {
                    toDetailView.toggle()
                    paletteColorList=[color3_1,color3_2,color3_3,color3_4]

                }) {
                    Image(level3Palette)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 75)
                }.padding().disabled(level3Palette=="lock")
                
                //level 4 palette
                Button(action: {
                    paletteColorList=[color4_1,color4_2,color4_3,color4_4]
                    toDetailView.toggle()

                }) {
                    Image(level4Palette)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 75)
                }.padding().disabled(level4Palette=="lock")
                
                //level 5 palette
                Button(action: {
                    paletteColorList=[color5_1,color5_2,color5_3]
                    toDetailView.toggle()

                }) {
                    Image(level5Palette)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 75)
                }.padding().disabled(level5Palette=="lock")
                Spacer()
            }.toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        rootActive.toggle()
                            }) {
                                Image(systemName: "arrowshape.turn.up.backward.fill").font(.system(size: 35))
                            }.frame(width:70)
                    
                 
                }
            }
            
          /* (content: {
                Button("menu",action: {
                    rootActive=false
                })
            })*/
            
        }
    }
}

struct PalletesView_Previews: PreviewProvider {
    static var previews: some View {
        PalettesView(level1Completed: .constant(false),level2Completed: .constant(false),level3Completed: .constant(false),level4Completed: .constant(false),level5Completed: .constant(false),rootActive: .constant(false))
    }
}
