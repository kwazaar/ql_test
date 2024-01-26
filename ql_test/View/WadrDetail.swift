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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let width: CGFloat = UIScreen.main.bounds.width - 40
    private let height: CGFloat = UIScreen.main.bounds.height / 3
    private let padding: CGFloat = 20
    
    var id: String
    init(id: String) {
        self.id = id
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                if viewModel.modelWard.image != nil {
                    VStack(spacing: 10) {
                        Image(uiImage: viewModel.modelWard.image!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: height)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        
                        Text(viewModel.modelWard.name)
                            .font(.system(.title))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                        
                        Text("Город : \(viewModel.modelWard.city)")
                        Text("История жизни: \(viewModel.modelWard.story)")
                    }
                }
            }
            .frame(width: width, alignment: .leading)
        }
        .navigationBarItems(
                    leading:
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                Text("Назад")
                                    .foregroundColor(.black)
                            }
                        }
                )
        .onAppear {
            viewModel.fetchModel(id: id)
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    WadrDelail(wardModel: WardsModel(idData: "5fba91236a59c85282abd21d", name: "asdasdasdasd", image: UIImage(named: "Image")!, city: "asdasdasd", story: "sadsjhfbsdjhfbsjdfb sdbf kbsdf bsdofbhosdfb sbdfob osdbofbsa bdfo basdf", date: "33-22-11"))
//}
