//
//  FavoritePropertyCard.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 17/06/1445 AH.
//

import SwiftUI

struct FavoritePropertyCard: View {
    var favoritePropertyId:UUID
    var image:UUID
    var title:String
    var city:String
    var price:String
    @State var isPresented = false
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .frame(width: 350,height: 150)
            .shadow(color: .gray.opacity(0.2), radius: 10)
            .overlay {
                HStack{
                    AsyncImage(url: URL(string: "https://gsreutvymfkohydenbjm.supabase.co/storage/v1/object/public/Images/user\(image)/img0ForUser\(image)"),
                        content: { image in
                        image.resizable()
                        
                        .frame(width: 130,height: 130)
                        .cornerRadius(10)
                            
                    },
                     placeholder: {
                        ProgressView()
                    })
                    .frame(width: 130,height: 130)
                    .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10){
                        Text(LocalizedStringKey(title))
                            .font(.title3)
                            .bold()
                        Text("$\(price)")
                            .bold()
                            .foregroundStyle(.appBlue)
                        HStack{
                            Text(LocalizedStringKey(city))
                                .foregroundStyle(.gray)
                                .font(.callout)
                            Image(systemName: "heart.fill" )
                                .font(.title2)
                                .foregroundStyle(.appBlue)
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                        }
                    }
                    Spacer()
                
                       
                }.padding(.horizontal)
            } .sheet(isPresented: $isPresented, content: {
                ConfomDeletFromFavorite(presentSheet: $isPresented, favoritePropertyId: favoritePropertyId)
                    .presentationDetents([.medium, .medium, .height(200)])
            })
            

            
    }
}
    
//#Preview {
//    FavoritePropertyCard()
//}
