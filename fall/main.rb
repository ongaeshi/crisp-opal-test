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

  def update(player_color)
    @pos.y += 1
  
    if char(@string, @pos).is_colliding.char.a
      if player_color == "red" && @string == "b" ||
        player_color == "black" && @string == "c"
        add_score(1, @pos)
        return true
      else
        end_game
      end
    end

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

  if input.is_just_pressed
    @player_color = @player_color == "red" ? "black" : "red"
  end

  color(@player_color)
  char("a", input.pos.x, 95)

  color("black")
  @fallings.push(Falling.new(rndi(2) == 1 ? "b" : "c", rnd(100), 0)) if ticks % 5 == 0
  @fallings.delete_if do |e|
    e.update(@player_color)
  end
end
