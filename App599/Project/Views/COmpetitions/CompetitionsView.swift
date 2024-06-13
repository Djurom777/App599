//
//  CompetitionsView.swift
//  App599
//
//  Created by IGOR on 09/06/2024.
//

import SwiftUI

struct CompetitionsView: View {
    
    @StateObject var viewModel = CompetitionsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Competitions")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(width: 50, height: 80)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCategory = index
                                viewModel.fetchMatches()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                    .padding(.horizontal)
                                    .frame(height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentCategory == index ? Color("primary") : .white))
                            })
                        }
                    }
                }
                .frame(height: 100)
                
                VStack {
                    
                    Text("Add a match")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.teamPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentT1Photo = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                                
                            }
                            
                        }, label: {
                            
                            if viewModel.currentT1Photo.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 20))
                                    .padding(20)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("primary")))
                                
                            } else {
                                
                                Image(viewModel.currentT1Photo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70)
                            }
                            
                        })
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Name of the 1st team")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter a name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .semibold))
                                    .opacity(viewModel.matName1.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.matName1)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 15, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 24)
                        }
                    }
                    
                    HStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.teamPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentT2Photo = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                                
                            }
                            
                        }, label: {
                            
                            if viewModel.currentT2Photo.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 20))
                                    .padding(20)
                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("primary")))
                                
                            } else {
                                
                                Image(viewModel.currentT2Photo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70)
                            }
                            
                        })
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Name of the 2nd team")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter a name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .semibold))
                                    .opacity(viewModel.matName2.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.matName2)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 15, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 24)
                        }
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.matCat = viewModel.currentCategory
                        
                        viewModel.matPhoto1 = viewModel.currentT1Photo
                        viewModel.matPhoto2 = viewModel.currentT2Photo
                        
                        viewModel.addMatch()
                        
                        viewModel.currentT1Photo = ""
                        viewModel.currentT2Photo = ""
                        viewModel.matName1 = ""
                        viewModel.matName2 = ""
                        
                        viewModel.fetchMatches()
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                    .opacity(viewModel.currentT1Photo.isEmpty || viewModel.currentT2Photo.isEmpty || viewModel.matName1.isEmpty || viewModel.matName2.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currentT1Photo.isEmpty || viewModel.currentT2Photo.isEmpty || viewModel.matName1.isEmpty || viewModel.matName2.isEmpty ? true : false)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                
                if viewModel.matches.isEmpty {
                    
                    VStack {
                        
                        Text("Match history")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .bold))
                        
                        VStack {
                            
                            Text("There are no records")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .shadow(color: .gray, radius: 8)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {

                        LazyVStack {
                            
                            Text("Match history")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .bold))
                            
                            
                            ForEach(viewModel.matches, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedMatch = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(spacing: 6) {
                                            
                                            Image(index.matPhoto1 ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                            
                                            Text(index.matName1 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Image("vs")
                                        
                                        Spacer()
                                        
                                        VStack(spacing: 6) {
                                            
                                            Image(index.matPhoto2 ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 70)
                                            
                                            Text(index.matName2 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    .shadow(color: .gray, radius: 8)
                                })
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCat ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCat = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Create a category")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Category")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.category.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.category)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.categories.append(viewModel.category)
                        
                        viewModel.category = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCat = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(.green)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                    })
                    .opacity(viewModel.category.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.category.isEmpty ? true : false)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isAddCat ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchMatches()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete an entry?")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(Color.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                            
                        })
                        
                        Button(action: {
         
                            CoreDataStack.shared.deleteMatch(withMatName1: viewModel.selectedMatch?.matName1 ?? "", completion: {
                                
                                viewModel.fetchMatches()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)

                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CompetitionsView()
}
