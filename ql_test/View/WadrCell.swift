//
//  WadrCell.swift
//  ql_test
//
//  Created by Максим Сизов on 25.01.2024.
//

import SwiftUI



struct WadrCell: View {
    
    var image: UIImage
    var fullName: String
    
    init(image: UIImage, fullName: String) {
        self.image = image
        self.fullName = fullName
    }
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height / 3
        let padding = CGFloat(20)
        VStack(spacing: 10) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width - padding * 2, height: height)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    
                    
                Text(fullName)
                .font(.system(.title))
                .foregroundStyle(.black)
                    
            }
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    WardsListView()
}
