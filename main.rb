# Write the game name to 'title'.
TITLE = "PIN CLIMB(RUBY)"

# 'description' is displayed on the title screen.
DESCRIPTION = <<EOS
[Hold] Stretch
From RUBY
EOS

OPTIONS = {
  "isPlayingBgm": true,
  "isReplayEnabled": false,
  # If you want to play a different BGM or SE,
  # you can try changing the 'seed' value used to generate sounds.
  "seed": 1,
}

%x{
title = #{TITLE};
description = #{DESCRIPTION};
options = #{OPTIONS.to_n};
}