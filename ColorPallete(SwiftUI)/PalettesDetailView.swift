//
//  PalettesDetailView.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/15/23.
//

import SwiftUI

struct PalettesDetailView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(paletteColorList,id: \.name){ color in
                    
                    Section(header: Text(color.name).bold().foregroundColor(.black).font(.system(size: 25))){
                        
                        Rectangle()
                            .fill(color.rgb)
                                    .frame(width: 300, height: 50)
                        Text("HEX: "+color.hex).font(.system(size: 20))
                        Text("RGB: (\(color.r), \(color.g), \(color.b))").font(.system(size: 20))
                        
                        
                    }
                }
            }
            
            
        }
    }
}

struct PalettesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PalettesDetailView()
    }
}
