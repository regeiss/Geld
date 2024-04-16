//
//  PerfilView.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 29/03/24.
//

import SwiftUI

struct PerfilDetalheView: View 
{
    @Binding var perfil: Perfil

    var body: some View
    {
        HStack
        {
            TextField(perfil.nome, text: $perfil.nome)
            Spacer()
        }.contentShape(Rectangle())
    }
}

struct ProfileText: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("subtitle") var subtitle = DefaultSettings.subtitle
    @AppStorage("description") var description = DefaultSettings.description

    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(name)
                    .bold()
                    .font(.title)
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

struct Header: View {
    @AppStorage("rValue") var rValue = 0.55 // DefaultSettings.rValue
    @AppStorage("gValue") var gValue = 0.74 // DefaultSettings.gValue
    @AppStorage("bValue") var bValue = 0.45 // DefaultSettings.bValue

    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)

            Image("person.fill.checkmark")
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                .shadow(radius: 10)
        }
    }
}

struct HeaderBackgroundSliders: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue

    var body: some View {
        Section(header: Text("Header Background Color")) {
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 100)
                        .foregroundColor(Color(red: 0.23, green: 0.55, blue: 0.45, opacity: 1.0))
                }
                //                VStack {
                //                    Text("R: \(Int(rValue * 255.0))")
                //                    Text("G: \(Int(gValue * 255.0))")
                //                    Text("B: \(Int(bValue * 255.0))")
                //                }
                VStack {
                    ColorSlider(value: $rValue, textColor: .red)
                    ColorSlider(value: $gValue, textColor: .green)
                    ColorSlider(value: $bValue, textColor: .blue)
                }
            }
        }
    }
}
struct ColorSlider: View
{
    @Binding var value: Double
    var textColor: Color

    var body: some View {
        HStack {
            Text(verbatim: "0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0.0...1.0)
            Text(verbatim: "255")
                .foregroundColor(textColor)

        }
    }
}

struct ProfileSettings: View 
{
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("subtitle") var subtitle = DefaultSettings.subtitle
    @AppStorage("description") var description = DefaultSettings.description

    var body: some View {
        Section(header: Text("Profile")) {
            Button(
                action: {
                    // Action
                },
                label: {
                    Text("Pick Profile Image")
                }
            )
            TextField("Name", text: $name)
            TextField("Subtitle", text: $subtitle)
            TextEditor(text: $description)
        }
    }
}
