//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Maksim Kalik on 8/18/22.
//

import SwiftUI

struct ContentView: View {
    
    private var list: [String] = "POET GESTURAL VILLAGE COLOSSAL FINANCIAL ABERRANT ABATTOIR LONER HOMICIDE FAMILY STEEL BARNBURNER PROMISED GOOD-BYE PICNIC CALLOUS CLIMAX SUPERFICIAL TRITE BRUSH LOSS BEEKEEPER ELFIN AUNT DISCLOSURE BLUSHING COWARDLY UNCOVERED DAUGHTER HOOLIGAN FALLACIOUS BLUEPRINT ACHE PUSHY RACKET COSTUMED ARMS EASTERN SPEND GIVE INNER CROOKED MAJESTIC DIAMETRIC MATURE REST PARTICIPATE MIGRATE DESCRIPTION COAL MOW MOLTEN BLINDING GUTS DETAILS EGGS RECALL FRIGHTENING UNSUITABLE REMARKABLE LAMP WATER FUSE PRESERVE SIGN DISTURBANCE SADDLE RUTHLESS GODLESS DASHING UGLY XENOPHOBIC UNADVISED OPERATE FIREARM ASHES ILLEGAL MOTH PITY AGONIZING ABSENCE TWO BLEAKNESS CINNAMON HACK HIRSUTE SILENT CASE NERVE ETERNITY DISTORT THRONE ABIDE CLUBFOOT CURSED DISTANCE COMET OVERT SERUM CRUCIFIER"
            .components(separatedBy: " ")

    private var listModels: [ContentModel] {
        (1...20).map {
            ContentModel(
                imageName: String(format: "%02d", $0),
                title: list.randomElement() ?? "Unknown"
            )
        }
    }
    
    
    var body: some View {
        NavigationView {
            
            List(listModels) { model in
                NavigationLink {
                    DetailsScreen(model: model)
                } label: {
                    ContentRow(model: model)
                }
            }
            .navigationTitle("Architecture")
            .listStyle(.plain)
            .navigationBarItems(
                leading:
                    Button("Left Button") { },
                trailing:
                    Button("Right Button") { }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        // .navigationViewStyle(.stack)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
