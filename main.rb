setup(
  # Write the game name to 'title'.
  title: "crisp-opal-test",
  # 'description' is displayed on the title screen.
  description: <<~EOS,
    01234656789
    abcdefghijklmnop
    ABCDEFGHIJKLMNOP
    !"#$%&'()@=~-=|{
  EOS
  # Define pixel arts of characters.
  # Each letter represents a pixel color.
  # (l: black, r: red, g: green, b: blue
  #  y: yellow, p: purple, c: cyan
  #  L: light_black, R: light_red, G: light_green, B: light_blue
  #  Y: light_yellow, P: light_purple, C: light_cyan)
  # Characters are assigned from 'a'.
  # 'char("a", 0, 0);' draws the character
  # defined by the first element of the array.
  characters: [
    <<~EOS
      lrgby
      llpcL
      lllRG
      llllY
      lllll
    EOS
  ],
  # Configure game options.
  options: {
    isPlayingBgm: false, # true
    isReplayEnabled: true,
    # If you want to play a different BGM or SE,
    # you can try changing the 'seed' value used to generate sounds.
    seed: 1,
  },
  # if "true", skip title mode.
  debug: true,
)

@char = nil
@i = nil

# 'update()' is called every frame (60 times per second).
def update
  color("red")
  # Draw the box.
  # box(x, y, width, height?)
  # box(pos, size)
  box(20, 20, 15, 20)
  # Draw the rectangle.
  # rect(x, y, width, height?)
  # rect(pos, size)
  rect(70, 20, 20, 25)
  # Draw the bar.
  # bar(x, y, length, thickness, rotate, centerPosRatio?)
  # bar(pos, length, thickness, rotate, centerPosRatio?)
  bar(20, 70, 18, 5, 0.7, 0.5)
  # Draw the line.
  # line(x1, y1, x2, y2, thickness)
  # line(p1, p2, thickness)
  line(70, 70, 90, 80)
  # Draw the arc.
  # arc(x, y, radius, thickness?, angleFrom?, angleTo?)
  # arc(pos, radius, thickness?, angleFrom?, angleTo?)
  arc(30, 60, 20, 5, 0.1, 1.5)
  # Draw the text.
  # text(string, x, y, options?)
  # text(string, p, options?)
  text("a", 10, 20)

  color("black")
  # Draw the user defined character.
  # char(string, x, y, options?)
  # char(string, p, options?)
  char("a", 30, 40)

  text("ticks: #{ticks}", 1, 50)
  text("difficulty: #{difficulty}", 1, 60)
  text("score: #{score}", 1, 70)

  add_score(1) if ticks % 50 == 0
  add_score(2, 50, 50) if ticks % 40 == 0
  add_score(3, input.pos) if ticks % 30 == 0

  particle(rnd(50, 100), 20) if ticks % 40 == 0

  # end_game if input.is_just_pressed

  color("blue")
  box(vec, 10, 10)
  color("light_blue")
  box(vec(10), 10, 10)
  color("yellow")
  box(vec(10, 10), 10, 10)
  color("light_yellow")
  box(vec(0, 10), 10, 10)

  color("blue")

  v = vec(1, 2)
  v.set(10, 30)
  box(v, 5, 10)

  v.add(5, 10)
  box(v, 5, 10)

  v.sub(3, 5)
  box(v, 5, 10)

  v.mul(2)
  box(v, 5, 10)

  v.div(1.5)
  box(v, 5, 10)

  if ticks == 0
    @char = "A"
  elsif ticks % 5 == 0
    @char = add_with_char_code(@char, 1)
    @char = "A" if @char == "{"
  end

  text(@char, 30, 30)

  box(vec(50, 50), vec(10, 5))
  if ticks == 0
    @i = 0
  elsif ticks % 1 == 0
    @i += 1
    @i = 0 if @i >= 30
  end
  box(vec(50, 60), @i)
  box(vec(50, 70), 5, 10)
end
