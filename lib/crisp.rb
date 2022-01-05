def setup(opts = {})
  win = Native(`window`)
  unless opts[:debug]
    win[:title] = opts[:title] if opts[:title]
    win[:description] = opts[:description] if opts[:description]
  end

  if opts[:characters]
    win[:characters] = opts[:characters].map do |e|
      "\n" + e
    end
  end

  win[:options] = opts[:options].to_n if opts[:options]
end

class Collision
  def initialize(js)
    @js = Native(js)
  end

  def is_colliding
    @js[:isColliding]
  end
end

def color(color_name)
  JS.call(:color, color_name)
end

# Draw box (center-aligned rect)
def box(x, y, width = nil, height = nil)
  x = x.to_n if x.is_a?(Vector)
  y = y.to_n if y.is_a?(Vector)

  collision = if width
    if height
      JS.call(:box, x, y, width, height)
    else
      JS.call(:box, x, y, width)
    end
  else
    JS.call(:box, x, y)
  end

  Collision.new(collision)
end

# Draw rectangle
def rect(x, y, width = nil, height = nil)
  x = x.to_n if x.is_a?(Vector)

  collision = if width
    if height
      JS.call(:rect, x, y, width, height)
    else
      JS.call(:rect, x, y, width)
    end
  else
    JS.call(:rect, x, y)
  end

  Collision.new(collision)
end

# Draw bar (angled rect)
def bar(x, y, length, thickness, rotate = nil, center_pos_ratio = nil)
  x = x.to_n if x.is_a?(Vector)

  collision = if rotate
    if center_pos_ratio
      JS.call(:bar, x, y, length, thickness, rotate, center_pos_ratio)
    else
      JS.call(:bar, x, y, length, thickness, rotate)
    end
  else
    JS.call(:bar, x, y, length, thickness)
  end

  Collision.new(collision)
end

# Draw line
def line(x1, y1, x2 = nil, y2 = nil, thickness = nil)
  x1 = x1.to_n if x1.is_a?(Vector)
  y1 = y1.to_n if y1.is_a?(Vector)

  collision = if x2
    if y2
      if thickness
        JS.call(:line, x1, y1, x2, y2, thickness)
      else
        JS.call(:line, x1, y1, x2, y2)
      end
    else
      JS.call(:line, x1, y1, x2)
    end
  else
    JS.call(:line, x1, y1)
  end

  Collision.new(collision)
end

# Draw arc
def arc(x, y, radius = nil, thickness = nil, angle_from = nil, angle_to = nil)
  x = x.to_n if x.is_a?(Vector)

  collision = if radius
    if thickness
      if angle_from
        if angle_to
          JS.call(:arc, x, y, radius, thickness, angle_from, angle_to)
        else
          JS.call(:arc, x, y, radius, thickness, angle_from)
        end
      else
        JS.call(:arc, x, y, radius, thickness)
      end
    else
      JS.call(:arc, x, y, radius)
    end
  else
    JS.call(:arc, x, y)
  end

  Collision.new(collision)
end

# TODO: options https://github.com/abagames/crisp-game-lib/blob/0e5542c9cb1024592bb8ae014bd9f63180efcb30/src/letter.ts#L25
def text(string, x, y)
  collision = JS.call(:text, string, x, y)
  Collision.new(collision)
end

# TODO: options https://github.com/abagames/crisp-game-lib/blob/0e5542c9cb1024592bb8ae014bd9f63180efcb30/src/letter.ts#L38
def char(string, x, y)
  collision = JS.call(:char, string, x, y)
  Collision.new(collision)
end

class Vector
  def initialize(x = nil, y = nil)
    x = x.to_n if x.is_a?(Vector)

    @js = if x
      if y
        JS.call(:vec, x, y)
      else
        JS.call(:vec, x)
      end
    else
      JS.call(:vec)
    end
  end

  def x
    @js.JS[:x]
  end

  def x=(v)
    @js.JS[:x] = v
  end

  def y
    @js.JS[:y]
  end

  def y=(v)
    @js.JS[:y] = v
  end

  def set(x = nil, y = nil)
    if x
      if y
        @js.JS.set(x, y)
      else
        @js.JS.set(x)
      end
    else
      @js.JS.set
    end
  end

  def add(x = nil, y = nil)
    if x
      if y
        @js.JS.add(x, y)
      else
        @js.JS.add(x)
      end
    else
      @js.JS.add
    end
  end

  def sub(x = nil, y = nil)
    if x
      if y
        @js.JS.sub(x, y)
      else
        @js.JS.sub(x)
      end
    else
      @js.JS.sub
    end
  end

  def mul(v)
    @js.JS.mul(v)
  end

  def div(v)
    @js.JS.div(v)
  end

  def clamp(x_low, x_high, y_low, y_high)
    @js.JS.clamp(x_low, x_high, y_low, y_high)
  end

  def wrap(x_low, x_high, y_low, y_high)
    @js.JS.wrap(x_low, x_high, y_low, y_high)
  end

  def add_with_angle(angle, length)
    @js.JS.addWithAngle(angle, length)
    self
  end

  def swap_xy
    @js.JS.swapXy
  end

  def normalize
    @js.JS.normalize
  end

  def rotate(angle)
    @js.JS.rotate(angle)
  end

  def angle_to(x = nil, y = nil)
    if x
      if y
        @js.JS.angleTo(x, y)
      else
        @js.JS.angleTo(x)
      end
    else
      @js.JS.angleTo
    end
  end

  def distance_to(x = nil, y = nil)
    if x
      if y
        @js.JS.distanceTo(x, y)
      else
        @js.JS.distanceTo(x.to_n)
      end
    else
      @js.JS.distanceTo
    end
  end

  def is_in_rect(x, y, width, height)
    @js.JS.isInRect(x, y, width, height)
  end

  def equals(other)
    @js.JS.equals(other)
  end

  def floor
    @js.JS.floor
  end

  def round
    @js.JS.round
  end

  def ceil
    @js.JS.ceil
  end

  def length
    @js.JS.length
  end

  def angle
    @js.JS.angle
  end

  def to_n
    @js
  end
end

class Input
  @@self = nil

  def self.instance
    @@self = Input.new if @@self.nil?
    @@self
  end

  def initialize
    @input = Native(`window`)[:input]
  end

  def pos
    ip = @input[:pos]
    Vector.new(ip[:x], ip[:y])
  end

  def is_pressed
    @input[:isPressed]
  end

  def is_just_pressed
    @input[:isJustPressed]
  end

  def is_just_released
    @input[:isJustReleased]
  end
end

def input
  Input.instance
end

def play(type)
  JS.call(:play, type)
end

# Game ticks (60 ticks = 1 second)
def ticks
  `ticks`
end

# Game difficulty (starts at 1, incremented by 1 per minute)
def difficulty
  `difficulty`
end

# Game score
def score
  `score`
end

# Add up score
def add_score(value, x = nil, y = nil)
  if x.nil?
    JS.call(:addScore, value)
  elsif x.is_a?(Vector)
    JS.call(:addScore, value, x.to_n)
  else
    JS.call(:addScore, value, x, y)
  end
end

# Add particles.
def particle(x, y, count = 16, speed = 1, angle_width = PI * 2)
  JS.call(:particle, x, y, count, speed, angle_width)
end

# End game. (Game Over)
def end_game
  JS.call(:end)
end

# Return random number.
def rnd(low_or_high = nil, high = nil)
  rnd_common(:rnd, low_or_high, high)
end

# Return random integer.
def rndi(low_or_high = nil, high = nil)
  rnd_common(:rndi, low_or_high, high)
end

# Return positive or negative random number.
def rnds(low_or_high = nil, high = nil)
  rnd_common(:rnds, low_or_high, high)
end

def rnd_common(symbol, low_or_high, high)
  if low_or_high.nil?
    JS.call(symbol)
  elsif high.nil?
    JS.call(symbol, low_or_high)
  else
    JS.call(symbol, low_or_high, high)
  end
end

# Return Vector instance.
def vec(x = nil, y = nil)
  Vector.new(x, y)
end

PI = Math::PI

def abs(v)
  JS.call(:abs, v)
end

def sin(v)
  JS.call(:sin, v)
end

def cos(v)
  JS.call(:cos, v)
end

def atan2(y, x)
  JS.call(:atan2, y, x)
end

def pow(b, e)
  JS.call(:pow, b, e)
end

def sqrt(v)
  JS.call(:sqrt, v)
end

def floor(v)
  JS.call(:floor, v)
end

def round(v)
  JS.call(:round, v)
end

def ceil(v)
  JS.call(:ceil, v)
end

def clamp(v, low = nil, high = nil)
  if low
    if high
      JS.call(:clamp, v, low, high)
    else
      JS.call(:clamp, v, low)
    end
  else
    JS.call(:clamp, v)
  end
end

def wrap(v, low, high)
  JS.call(:wrap, v, low, high)
end

def range(v)
  JS.call(:range, v)
end

# function times<T>(count: number, func: (index: number) => T): T[];
# function remove<T>(array: T[], func: (v: T, index?: number) => any): T[];

def add_with_char_code(char, offset)
  JS.call(:addWithCharCode, char, offset)
end
