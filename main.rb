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
  # User-defined characters can be written here.
  # characters: [],
  # Configure game options.
  options: {
    isPlayingBgm: false, # TODO: リリース時はtrue
    isReplayEnabled: true,
    # If you want to play a different BGM or SE,
    # you can try changing the 'seed' value used to generate sounds.
    seed: 1
  },
  # if "true", skip title mode.
  # debug: true
)

# 'update()' is called every frame (60 times per second).
def update
  1.upto(5) do |e|
    box(20 * e, 20 * e, 15, 15)
  end
end
