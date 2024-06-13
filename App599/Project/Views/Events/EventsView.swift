//
//  EventsView.swift
//  App599
//
//  Created by IGOR on 09/06/2024.
//

import SwiftUI

struct EventsView: View {

    @StateObject var viewModel = EventsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Events")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.events.isEmpty {
                    
                    VStack {
                        
                        Image("calendar")
                        
                        Text("You haven't added any events")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add an event")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        })
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.events, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Image(index.evPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 200)
                                    
                                    Text(index.evTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .semibold))
                                        
                                    Text(index.evLocation ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text(index.evDate ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 11, weight: .regular))
                                            .padding(3)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 9).fill(Color("primary")))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add an event")
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .semibold))
                        .padding()
                    
                    Menu(content: {
                        
                        ForEach(viewModel.evPhotos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentPhoto = index
                                
                            }, label: {
                                
                                Image(index)
                            })
                            
                        }
                        
                    }, label: {
                        
                        if viewModel.currentPhoto.isEmpty {
                            
                            Image(systemName: "photo")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 40))
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(RoundedRectangle(cornerRadius: 25).stroke(Color("primary")))
                            
                        } else {
                            
                            Image(viewModel.currentPhoto)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                        }
                        
                    })
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Title")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.evTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evTitle)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("primary")))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Location")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.evLocation.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evLocation)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("primary")))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.evDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.evDate)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("primary")))
                    .padding(1)
                    .padding(.bottom)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color("primary")))
                                .padding(1)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.evPhoto = viewModel.currentPhoto
                            
                            viewModel.addEvent()
                            
                            viewModel.evTitle = ""
                            viewModel.evLocation = ""
                            viewModel.evDate = ""
                            viewModel.currentPhoto = ""
                            
                            viewModel.fetchEvents()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                .padding(1)
                        })
                        .opacity(viewModel.currentPhoto.isEmpty || viewModel.evTitle.isEmpty || viewModel.evLocation.isEmpty || viewModel.evDate.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currentPhoto.isEmpty || viewModel.evTitle.isEmpty || viewModel.evLocation.isEmpty || viewModel.evDate.isEmpty ? true : false)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchEvents()
        }
    }
}

#Preview {
    EventsView()
}
