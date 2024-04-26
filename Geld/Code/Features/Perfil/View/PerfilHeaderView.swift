//
//  PerfilHeaderView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 25/04/24.
//

import SwiftUI

struct PerfilHeaderView: View
{
    var body: some View
    {

        ZStack(alignment: .top)
        {
            VStack
            {
                Rectangle()
                    .foregroundColor(Color(.lightGray))
                    .frame(height: 198)
            }.edgesIgnoringSafeArea(.top)

            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
        // Spacer()
    }

}

#Preview {
    PerfilHeaderView()
}
