//
//  ConfomDeletFromFavorite.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 17/06/1445 AH.
//

import SwiftUI

struct ConfomDeletFromFavorite: View {
   @Binding var presentSheet:Bool
    var favoritePropertyId: UUID
    @ObservedObject var deleteFavotiteVM = PropertyViewModel()
    var body: some View {
        VStack{
            Text("Remove")
                .bold()
                .foregroundStyle(.red)
                .padding(.top)
            Divider()
                .padding(.horizontal,30)
            Text("Are you sure you want to remove from favorites?")
                .frame(width: 250)
                .multilineTextAlignment(.center)
            
            HStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.lightBlue)
                    .frame(width: 150,height: 50)
                    .overlay {
                        Button(action: {
                            presentSheet.toggle()
                        }, label: {
                            Text("Cancle")
                                .bold()
                                .foregroundStyle(.appBlue)
                        })
                    }
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.appBlue)
                    .frame(width: 150,height: 50)
                    .overlay {
                        Button(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                Task{
                                    await deleteFavotiteVM.deleteFavoriteProperty(favoritePropertyId: favoritePropertyId)
                                }
                            }
                            presentSheet.toggle()
                        }, label: {
                            Text("Yes,remove")
                                .foregroundStyle(.white)
                                .bold()
                        })
                    }
            }
           Spacer()
        }
    }
}

//#Preview {
//    ConfomDeletFromFavorite(presentSheet: false)
//}
