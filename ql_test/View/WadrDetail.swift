//
//  WadrDelail.swift
//  ql_test
//
//  Created by Максим Сизов on 25.01.2024.
//

import SwiftUI
import PomoshAPI

struct WadrDetail: View {
    
    @ObservedObject var viewModel = WardDetailViewModel()
    
    var id: String
    init(id: String) {
        self.id = id
    }
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height / 3
        let padding = CGFloat(20)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                if viewModel.modelWard.image != nil {
                    
                    VStack(spacing: 10) {
                        Image(uiImage: viewModel.modelWard.image!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: width - padding * 2, height: height)
                            .clipShape(.rect(cornerRadius: 20))
                        Text(viewModel.modelWard.name)
                            .font(.system(.title))
                            .foregroundStyle(.black)
                        Text("Город : \(viewModel.modelWard.city)")
                        Text("История жизни: \(viewModel.modelWard.story)")
                    }
                }
            }
            .frame(width: width -  padding * 2, alignment: .leading)
        }
        .onAppear {
            viewModel.fetchModel(id: id)
        }
    }
}

//#Preview {
//    WadrDelail(wardModel: WardsModel(idData: "5fba91236a59c85282abd21d", name: "asdasdasdasd", image: UIImage(named: "Image")!, city: "asdasdasd", story: "sadsjhfbsdjhfbsjdfb sdbf kbsdf bsdofbhosdfb sbdfob osdbofbsa bdfo basdf", date: "33-22-11"))
//}
