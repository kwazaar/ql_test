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
    
    private let width: CGFloat = UIScreen.main.bounds.width - 40
    private let height: CGFloat = UIScreen.main.bounds.height / 3
    private let padding: CGFloat = 20
    
    init(image: UIImage, fullName: String) {
        self.image = image
        self.fullName = fullName
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(.rect(cornerRadius: 20))
            
            
            
            Text(fullName)
                .font(.system(.title))
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    WardsListView()
}
