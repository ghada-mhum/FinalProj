//
//  ChatRoomsComponent.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 16/06/1445 AH.
//

import SwiftUI

struct ChatRoomsComponent: View {
    var toUserId:UUID
    var image:String
    var userName:String
    var lastMessage:String
    var time:String
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: "https://gsreutvymfkohydenbjm.supabase.co/storage/v1/object/public/UsersAvatar/Avatar\(toUserId)"),
                           content: { image in
                    image.resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .frame(width: 70,height: 70)
                    
                },
                           placeholder: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundStyle(.gray)
                })
                .frame(width: 70,height: 70)
                .background(.gray.opacity(0.5))
                .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text(userName)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .bold()
//                    Text(lastMessage)
//                        .font(.callout)
//                        .foregroundStyle(.gray)
                }
                Spacer()
                
                
                
//                Text(time)
//                    .font(.callout)
//                    .foregroundStyle(.gray)
                
            }.padding(.horizontal)
            Divider()
                .padding(.leading,80)
        }
    }
}

//#Preview {
//    ChatRoomsComponent(image: "person", userName: "Name", lastMessage: "Last chat", time: "12:00")
//}
