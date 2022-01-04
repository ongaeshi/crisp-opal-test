setup(
  # Write the game name to 'title'.
  title: "PIN CLIMB",
  # 'description' is displayed on the title screen.
  description: <<~EOS,
    [Hold] Stretch
  EOS
  # Configure game options.
  options: {
    isPlayingBgm: true,
    isReplayEnabled: true,
    seed: 400
  },
  # debug: true # Skip title
)

class Cord
  attr_accessor :angle, :length, :pin

  def initialize(angle, length, pin)
    @angle = angle
    @length = length
    @pin = pin
  end
end

@cord = nil
@pins = nil
@next_pin_dist = nil
CORD_LENGTH = 7

# 'update()' is called every frame (60 times per second).
def update
  # 'ticks' counts the number of frames from the start of the game.
  if ticks == 0
    @pins = [vec(50, 0)]
    @next_pin_dist = 10
    @cord = Cord.new(0, CORD_LENGTH, @pins[0])
  end
  # 'difficulty' represents the difficulty of the game.
  # The value of this variable is 1 at the beginning of the game and
  # increases by 1 every minute.
  scr = difficulty * 0.02
  if @cord.pin.y < 80
    scr += (80 - @cord.pin.y) * 0.1
  end
  # 'input.isJustPressed' is set to true the moment the button is pressed.
  if input.is_just_pressed
    # 'play()' plays the SE.
    play("select")
  end
  # 'input.isPressed' is set to true while the button is pressed.
  @cord.length += if input.is_pressed
    difficulty
  else
    (CORD_LENGTH - @cord.length) * 0.1
  end
  @cord.angle += difficulty * 0.05
  # Draw a line connecting the coordinates of
  # the first argument and the second argument.
  line(@cord.pin, vec(@cord.pin).add_with_angle(@cord.angle, @cord.length))
  if @cord.pin.y > 98
    play("explosion")
    # Call 'end()' to end the game. (Game Over)
    end_game
  end
  next_pin = nil
  # 'remove()' passes the elements of the array of the first argument to
  # the function of the second argument in order and executes it.
  # If the function returns true, the element will be removed from the array.
  @pins.delete_if do |p|
    p.y += scr
    # Draw a box and check if it collides with other black rectangles or lines.
    if box(p, 3).is_colliding.rect.black && p != @cord.pin
      next_pin = p
    end
    p.y > 102
  end
  unless next_pin.nil?
    play("powerUp")
    # Add up the score.
    # By specifying the coordinates as the second argument,
    # the added score is displayed on the screen.
    add_score(ceil(@cord.pin.distanceTo(next_pin)), next_pin)
    @cord.pin = next_pin
    @cord.length = CORD_LENGTH
  end
  @next_pin_dist -= scr
  while @next_pin_dist < 0
    #'rnd()' returns a random value.
    @pins.push(vec(rnd(10, 90), -2 - @next_pin_dist));
    @next_pin_dist += rnd(5, 15)
  end
end
