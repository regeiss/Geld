//
//  MenuGavetaView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 18/04/24.
//

import SwiftUI

struct MenuGavetaView: View 
{
    var body: some View 
    {
        VStack
        {
            HStack
            {
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                }
                Spacer()
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "gear")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Ajustes")
                        .bold()


                }
                Spacer()
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                }
                Spacer()
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                }
            }.padding([.leading, .trailing], 35)

            HStack
            {
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                }
                Spacer()
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "gear")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Ajustes")
                        .bold()
                }
                Spacer()
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                }
                Spacer()
                VStack
                {
                    Button(action: acaoBotao) { Image(systemName: "person")
                            .imageScale(.large).font(.system(size: 25.0))
                    }
                    Text("Cartao")
                        .bold()
                }
            }.padding([.top, .leading, .trailing], 35)
        }
    }

    func acaoBotao()
    {

    }
}

#Preview 
{
    MenuGavetaView()
}
