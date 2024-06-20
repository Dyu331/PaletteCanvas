//
//  rgb color.swift
//  ColorPallete(SwiftUI)
//
//  Created by Danny Yu on 3/5/23.
//

import Foundation
import SwiftUI

/*struct rgb{
    var redInt:Int=50
    var greenInt:Int=50
    var blueInt:Int=50
    var name:String
    
    var red:CGFloat{
        CGFloat(Double(redInt)/255.0)
    }
    var green:CGFloat{
        CGFloat(Double(greenInt)/255.0)
    }
    var blue:CGFloat{
        CGFloat(Double(blueInt)/255.0)
    }
    
    init(red:Int,green:Int,blue:Int,n:String)
    {
        redInt=red
        greenInt=green
        blueInt=blue
        name=n
    }
    
   /* init(cgRed:CGFloat,cgGreen:CGFloat,cgBlue:CGFloat)
    {
        red=cgRed
        green=cgGreen
        blue=cgBlue
        redInt=
    }*/
    
    func isCloseTo(target:rgb)->Bool
    {
        if (abs(redInt-target.redInt)<=8 && abs(greenInt-target.greenInt)<=8 && abs(blueInt-target.blueInt)<=8)
        {
            return true
        }
        else{
            return false
        }
    }
 
}

struct targetList{
    var list:[rgb]=[]
    
    init(one:rgb,two:rgb,three:rgb)
    {
        list.append(one)
        list.append(two)
        list.append(three)
    }
    init(one:rgb,two:rgb,three:rgb,four:rgb)
    {
        list.append(one)
        list.append(two)
        list.append(three)
        list.append(four)
    }
    
    mutating func addColor(color:rgb)
    {
        list.append(color)
    }
    
    func closeToUser(one:rgb,two:rgb,three:rgb)->Bool
    {
        var bool1=false
        var bool2=false
        var bool3=false
        for color in self.list
        {
            if color.isCloseTo(target: one)
            {
                bool1=true
            }
        }
        for color in self.list
        {
            if color.isCloseTo(target: two)
            {
                bool2=true
            }
        }
        for color in self.list
        {
            if color.isCloseTo(target: three)
            {
                bool3=true
            }
        }
        if bool1&&bool2&&bool3
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func closeToUser(one:rgb,two:rgb,three:rgb,four:rgb)->Bool
    {
        var bool1=false
        var bool2=false
        var bool3=false
        let bool4=false
        for color in self.list
        {
            if color.isCloseTo(target: one)
            {
                bool1=true
            }
        }
        for color in self.list
        {
            if color.isCloseTo(target: two)
            {
                bool2=true
            }
        }
        for color in self.list
        {
            if color.isCloseTo(target: three)
            {
                bool3=true
            }
        }
        for color in self.list
        {
            if color.isCloseTo(target: four)
            {
                bool1=true
            }
        }
        if bool1&&bool2&&bool3&&bool4
        {
            return true
        }
        else
        {
            return false
        }
    }
    
}*/

extension Color{
    var components:(red: CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat){
        var red:CGFloat=0,green:CGFloat=0,blue:CGFloat=0,alpha:CGFloat=1
        
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}

extension CGColor{
    var components:(red: CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat){
        var red:CGFloat=0,green:CGFloat=0,blue:CGFloat=0,alpha:CGFloat=1
        
        UIColor(cgColor: self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}


func colorsAreClose(_ color1: Color, _ color2: Color, tolerance: Double = 0.1) -> Bool {
    // Get the RGB components of the colors
    let uiColor1 = UIColor(color1)
    let uiColor2 = UIColor(color2)
    var red1: CGFloat = 0
    var green1: CGFloat = 0
    var blue1: CGFloat = 0
    var alpha1: CGFloat = 0
    var red2: CGFloat = 0
    var green2: CGFloat = 0
    var blue2: CGFloat = 0
    var alpha2: CGFloat = 0
    uiColor1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
    uiColor2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
    
    // Calculate the differences between the RGB components
    let redDiff = abs(Double(red1) - Double(red2))
    let greenDiff = abs(Double(green1) - Double(green2))
    let blueDiff = abs(Double(blue1) - Double(blue2))
    
    // Check if the differences are within the specified tolerance
    return redDiff < tolerance && greenDiff < tolerance && blueDiff < tolerance
}

func colorSetsSimilar3(_ list1: [Color], _ list2: [Color], difference: Double = 0.1) -> Bool {
    // Initialize a set to keep track of which colors have been matched
    var matchedColors: Set<Color> = []
    
    // Loop through each color in the first set
    for color1 in list1 {
        // Loop through each color in the second set
        for color2 in list2 {
            // Check if the two colors are close
            if colorsAreClose(color1, color2, tolerance: difference) {
                // If the colors are close and the second color hasn't already been matched,
                // mark the colors as matched and move on to the next color in the first set
                if !matchedColors.contains(color2) {
                    matchedColors.insert(color2)
                    break
                }
            }
        }
    }
    
    // If all 3 colors have been matched, the sets are similar
    return matchedColors.count == 3
}

func colorSetsSimilar4(_ list1: [Color], _ list2: [Color], difference: Double = 0.1) -> Bool {
    // Initialize a set to keep track of which colors have been matched
    var matchedColors: Set<Color> = []
    
    // Loop through each color in the first set
    for color1 in list1 {
        // Loop through each color in the second set
        for color2 in list2 {
            // Check if the two colors are close
            if colorsAreClose(color1, color2, tolerance: difference) {
                // If the colors are close and the second color hasn't already been matched,
                // mark the colors as matched and move on to the next color in the first set
                if !matchedColors.contains(color2) {
                    matchedColors.insert(color2)
                    break
                }
            }
        }
    }
    // If all 3 colors have been matched, the sets are similar
    return matchedColors.count == 4
}





var currentLevel=0


/*target colors for level 1
let level1_1=rgb(red: 18, green: 54, blue: 112, n: "Dark Cornflower Blue")
let level1_2=rgb(red: 132, green: 45, blue: 35, n: "Burnt Umber")
let level1_3=rgb(red: 199, green: 170, blue: 68, n: "Metallic Gold")
var level1List=targetList(one: level1_1, two: level1_2, three: level1_3)
//user colors for level 1
var user1_1:rgb=rgb(red: 0, green: 0, blue: 0, n: "")*/



//target color for level 1
let level1_1=Color(red: 18.0/255.0, green: 54.0/255.0, blue: 112.0/255.0)
let level1_2=Color(red: 132.0/255.0, green: 45.0/255.0, blue: 35.0/255.0)
let level1_3=Color(red: 199.0/255.0, green: 170.0/255.0, blue: 68.0/255.0)
let level1List=[level1_1,level1_2,level1_3]

//target color for level 2
let level2_1=Color(red: 198.0/255.0, green: 98.0/255.0, blue: 69.0/255.0)
let level2_2=Color(red: 14.0/255.0, green: 47.0/255.0, blue: 98.0/255.0)
let level2_3=Color(red: 208.0/255.0, green: 184.0/255.0, blue: 120.0/255.0)
let level2List=[level2_1,level2_2,level2_3]

//target color for level 3
let level3_1=Color(red: 64.0/255.0, green: 91.0/255.0, blue: 110.0/255.0)
let level3_2=Color(red: 93.0/255.0, green: 111.0/255.0, blue: 93.0/255.0)
let level3_3=Color(red: 202.0/255.0, green: 137.0/255.0, blue: 48.0/255.0)
let level3_4=Color(red: 180.0/255.0, green: 69.0/255.0, blue: 47.0/255.0)
let level3List=[level3_1,level3_2,level3_3,level3_4]


//target color for level 4
let level4_1=Color(red: 21.0/255.0, green: 54.0/255.0, blue: 45.0/255.0)
let level4_2=Color(red: 57.0/255.0, green: 89.0/255.0, blue: 59.0/255.0)
let level4_3=Color(red: 105.0/255.0, green: 147.0/255.0, blue: 155.0/255.0)
let level4_4=Color(red: 92.0/255.0, green: 140.0/255.0, blue: 196.0/255.0)
let level4List=[level4_1,level4_2,level4_3,level4_4]

//target color for level 5
let level5_1=Color(red: 196.0/255.0, green: 77.0/255.0, blue: 11.0/255.0)
let level5_2=Color(red: 167.0/255.0, green: 61.0/255.0, blue: 13.0/255.0)
let level5_3=Color(red: 134.0/255.0, green: 38.0/255.0, blue: 13.0/255.0)
let level5List=[level5_1,level5_2,level5_3]

//struct with information for each color
struct colors{
    var rgb:Color
    var hex:String
    var name:String
    var r:Int{
        Int((Double(rgb.components.red)*255).rounded())
    }
    var g:Int{
        Int((Double(rgb.components.green)*255).rounded())
    }
    var b:Int{
       Int((Double(rgb.components.blue)*255).rounded())
    }
    
    init (rgb:Color,hex:String,name:String)
    {
        self.rgb=rgb
        self.hex=hex
        self.name=name
    }
}

//the list for the detailed description of each color
var paletteColorList=[color1_1,color1_2,color1_3]

var color1_1=colors(rgb: level1_1, hex: "#123670", name: "Yale Blue")
var color1_2=colors(rgb: level1_2, hex: "#842D23", name: "Burnt Umber")
var color1_3=colors(rgb: level1_3, hex: "#C7AA44", name: "Gold")

var color2_1=colors(rgb: level2_1, hex: "#C66245", name: "Jasper")
var color2_2=colors(rgb: level2_2, hex: "#0E2F62", name: "Berkeley Blue")
var color2_3=colors(rgb: level2_3, hex: "#D0B878", name: "Ecru")

var color3_1=colors(rgb: level3_1, hex: "#405B6E", name: "Payne's Gray")
var color3_2=colors(rgb: level3_2, hex: "#5D6F5D", name: "Feldgrau")
var color3_3=colors(rgb: level3_3, hex: "#CA8930", name: "Bronze")
var color3_4=colors(rgb: level3_4, hex: "#B4452F", name: "Persian red")

var color4_1=colors(rgb: level4_1, hex: "#15362D", name: "Dark green")
var color4_2=colors(rgb: level4_2, hex: "#39593B", name: "Hunter green")
var color4_3=colors(rgb: level4_3, hex: "#69939B", name: "Blue (Munsell)")
var color4_4=colors(rgb: level4_4, hex: "#5C8CC4", name: "Silver Lake Blue")

var color5_1=colors(rgb: level5_1, hex: "#C44D0B", name: "Mahogany")
var color5_2=colors(rgb: level5_2, hex: "#A73D0D", name: "Rust")
var color5_3=colors(rgb: level5_3, hex: "#86260D", name: "Sienna")


//description view information
var descriptionTitle=""
var descriptionImage="Level 1_PrimaryColor_Painting with Green Center"
var descriptionText=""

//result view information
var resultText="You have completed level 1: Painting With Green Center"
var resultDetail="This is an example of primary colors ..."
var resultPalettes="palette 1"




struct ClearFullCoverBackground:UIViewRepresentable{
    func makeUIView(context:Context)->UIView{
        let view = UIView()
        DispatchQueue.main.async{
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView:UIView,context:Context){
        
    }
}
