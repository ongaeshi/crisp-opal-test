setup(
  characters: [
    <<~EOS,
      llllll
      ll l l
      ll l l
      llllll
       l  l
       l  l
    EOS
    <<~EOS,
       pp
       pp
     rrrrrr
     rrrrrr
     rrrrrr
     rrrrrr
    EOS
    <<~EOS,
       yy
       yy
     llllll
     llllll
     llllll
     llllll
    EOS
  ],
  options: {
    isShowingScore: false,
  }
)

def update
  char("a", input.pos.x, 95)
  char("b", input.pos.x, 50)
  char("c", input.pos.x + 20, 50)
end
