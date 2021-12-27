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
  debug: true
)

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

  # Draw the user defined character.
  # char(string, x, y, options?)
  # char(string, p, options?)
  char("a", 30, 40)
end
