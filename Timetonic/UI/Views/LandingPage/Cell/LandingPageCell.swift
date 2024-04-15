//
//  LandingPageCell.swift
//  Timetonic
//
//  Created by Juan Bernier on 11/04/24.
//

import SwiftUI

struct LandingPageCell: View {
    let name: String?
    var image: String? = nil
    let urlImage : URL?
    init(name: String?, image: String? = nil) {
        self.name = name
        self.image = image
        urlImage = URL(string: "\(Constants.urlForImage)\(image ?? "")") ?? nil
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 30){
                imageSection
                textSection
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
    }
}

extension LandingPageCell{
    @ViewBuilder
    var imageSection: some View {
        if image != nil && image != nil{
            AsyncImage(url: urlImage) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)

        }else{
            VStack{
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                Text("Not available")
                    .font(.caption2)
            }
            .frame(width: 70, height: 70)

        }
    }
    @ViewBuilder
    var textSection: some View {
        if let safeName = name, safeName != ""{
            Text(safeName)
        }else{
            Text("Name Not Found")
        }
    }
}

#Preview {
    LandingPageCell(name: "Harry Potter", image: "/live/dbi/in/tb/FU-1701419839-65699b3f78400/mo dele-suivi-projet.jpg")
        .previewLayout(.sizeThatFits)
}



