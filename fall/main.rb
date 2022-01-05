setup(
  title: "FALL",
  description: <<~EOS,
    [Tap] Change color
  EOS
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
    isPlayingBgm: true,
    isReplayEnabled: true,
    seed: 200
  }
)

class Falling
  def initialize(string, x, y)
    @string = string
    @pos = vec(x, y)
  end

  def update
    @pos.y += 1
    char(@string, @pos)
    @pos.y > 102
  end
end

@fallings = nil

def update
  if ticks == 0
    @fallings = []
  end

  @fallings.push(Falling.new(rndi(2) == 1 ? "b" : "c", rnd(100), 0)) if ticks % 10 == 0
  @fallings.delete_if(&:update)
 
  if char("a", input.pos.x, 95).is_colliding.char.c
    end_game
  end
end