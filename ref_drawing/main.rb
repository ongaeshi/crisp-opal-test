setup(
  characters: [
    <<~EOS
      llllll
      ll l l
      ll l l
      llllll
       l  l
       l  l
    EOS
  ],
  options: {
    isShowingScore: false,
    viewSize: {x: 200, y: 100}.to_n
  }
)

def update
  color("red")
  box(20, 20, 15, 20)
end
