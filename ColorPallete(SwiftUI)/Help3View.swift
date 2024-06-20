//
//  Help3View.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 4/4/23.
//

import SwiftUI

struct Help3View: View {
    @Binding var backToLevel:Bool
    
    @Binding var user1:Color
    @Binding var user2:Color
    @Binding var user3:Color
    @Binding var user4:Color

    var body: some View {
        if backToLevel{
            ZStack{
                
                    VStack{
                        Spacer()
                        Text("Are you sure you want help?").padding()
                        Spacer()
                        Spacer()
                        
                            HStack{Button("No", action: {
                                backToLevel.toggle()
                                
                            }).foregroundColor(.white)
                            .padding()
                            .background(Color.gray.opacity(0.8))
                            .cornerRadius(10).bold().padding()
                                
                                Button("Yes", action: {
                                    backToLevel.toggle()
                                    
                                    user1=level3_1
                                    user2=level3_2
                                    user3=level3_3
                                    user4=level3_4
                                    
                                    
                                    
                                }).foregroundColor(.white)
                                .padding()
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10).bold().padding()
                            }
                        
                        Spacer()
                        
                        
                    }.frame(height:250).frame(width:350).background(Color(red: 0.98, green: 0.99, blue: 1.0)).cornerRadius(20).animation(.easeInOut)
                
                
                
            }
        }
        
        }
        
        
}



struct Help3View_Previews: PreviewProvider {
    static var previews: some View {
        Help3View(backToLevel: .constant(false),user1: .constant(Color(red: 0.5, green: 0.5, blue: 0.5)),user2: .constant(Color(red: 0.5, green: 0.5, blue: 0.5)),user3: .constant(Color(red: 0.5, green: 0.5, blue: 0.5)),user4: .constant(Color(red: 0.5, green: 0.5, blue: 0.5)))
    }
}
