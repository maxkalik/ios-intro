//
//  ContentView.swift
//  ListExample
//
//  Created by Maksim Kalik on 8/16/22.
//

import SwiftUI

var list: [String] = "POET GESTURAL VILLAGE COLOSSAL FINANCIAL ABERRANT ABATTOIR LONER HOMICIDE FAMILY STEEL BARNBURNER PROMISED GOOD-BYE PICNIC CALLOUS MAX SUPERFICIAL TRITE BRUSH LOSS BEEKEEPER ELFIN AUNT DISCLOSURE BLUSHING COWARDLY UNCOVERED DAUGHTER HOOLIGAN FALLACIOUS BLUEPRINT ACHE PUSHY RACKET COSTUMED ARMS EASTERN SPEND GIVE INNER CROOKED MAJESTIC DIAMETRIC MATURE REST PARTICIPATE MIGRATE DESCRIPTION COAL MOW MOLTEN BLINDING GUTS DETAILS EGGS RECALL FRIGHTENING UNSUITABLE REMARKABLE LAMP WATER FUSE PRESERVE SIGN DISTURBANCE SADDLE RUTHLESS GODLESS DASHING UGLY XENOPHOBIC UNADVISED OPERATE FIREARM ASHES ILLEGAL MOTH PITY AGONIZING ABSENCE TWO BLEAKNESS CINNAMON HACK HIRSUTE SILENT CASE NERVE ETERNITY DISTORT THRONE ABIDE CLUBFOOT CURSED DISTANCE COMET OVERT SERUM CRUCIFIER"
        .components(separatedBy: " ")


struct ContentView: View {

    var body: some View {
        List(list, id: \.self) {
            Text($0)
        }
    }
}

struct Row: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .frame(
                maxWidth: .infinity,
                minHeight: 50,
                maxHeight: 50,
                alignment: .leading
            )
            .overlay(
                Rectangle()
                    .frame(
                        width: nil,
                        height: 1,
                        alignment:.top
                    )
                    .foregroundColor(Color.gray.opacity(0.5)),
                alignment: .top
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
