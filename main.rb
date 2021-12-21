# Write the game name to 'title'.
TITLE = "crisp from RUBY"

# 'description' is displayed on the title screen.
DESCRIPTION = <<EOS
01234656789
abcdefghijklmnop
ABCDEFGHIJKLMNOP
!"#$%&'()@=~-=|{
EOS

OPTIONS = {
  "isPlayingBgm": false, # TODO: リリース時はtrue
  "isReplayEnabled": true,
  # If you want to play a different BGM or SE,
  # you can try changing the 'seed' value used to generate sounds.
  "seed": 1,
}

# TODO:
# // User-defined characters can be written here.
# characters = [];

# 'update()' is called every frame (60 times per second).
def update
  1.upto(5) do |e|
    JS.box(20 * e, 20 * e, 15, 15)
  end
end

# TODO: 別スクリプトに逃がす
%x{
title = #{TITLE};
description = #{DESCRIPTION};
options = #{OPTIONS.to_n};
}

