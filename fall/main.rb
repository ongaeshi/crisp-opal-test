setup(
  title: "FALL",
  description: <<~EOS,
       [TAP] 
    Change color
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

@player_color = nil
@fallings = nil

def update
  if ticks == 0
    @player_color = "red"
    @fallings = []
  end

  color("black")

  @fallings.push(Falling.new(rndi(2) == 1 ? "b" : "c", rnd(100), 0)) if ticks % 5 == 0
  @fallings.delete_if(&:update)

  if input.is_just_released && ticks != 0
    @player_color = @player_color == "red" ? "black" : "red"
  end

  color(@player_color)

  collision = char("a", input.pos.x, 95)

  if collision.is_colliding.char.b
    if @player_color == "black"
      end_game
    else
      add_score(1, input.pos)
    end
  elsif collision.is_colliding.char.c
    if @player_color == "red"
      end_game
    else
      add_score(1, input.pos)
    end
  end
end
