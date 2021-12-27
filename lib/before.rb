def setup(opts = {})
  win = Native(`window`)
  unless opts[:debug]
    win[:title] = opts[:title] if opts[:title]
    win[:description] = opts[:description] if opts[:description]
  end
  win[:options] = opts[:options].to_n if opts[:options]
end

def color(color_name)
  JS.call(:color, color_name)
end

def box(x, y, width, height)
  JS.call(:box, x, y, width, height)
end

def rect(x, y, width, height)
  JS.call(:rect, x, y, width, height)
end

def bar(x, y, length, thickness, rotate = 0.5, center_pos_ratio = 0.5)
  JS.call(:bar, x, y, length, thickness, rotate, center_pos_ratio)
end

def line(x1, y1, x2, y2, thickness = 3)
  JS.call(:line, x1, y1, x2, y2, thickness)
end

def arc(x, y, radius, thickness = 3, angle_from = 0, angle_to = Math::PI * 2)
  JS.call(:arc, x, y, radius, thickness, angle_from, angle_to)
end

# TODO: options https://github.com/abagames/crisp-game-lib/blob/0e5542c9cb1024592bb8ae014bd9f63180efcb30/src/letter.ts#L25
def text(string, x, y)
  JS.call(:text, string, x, y)
end

# TODO: options https://github.com/abagames/crisp-game-lib/blob/0e5542c9cb1024592bb8ae014bd9f63180efcb30/src/letter.ts#L38
def char(string, x, y)
  JS.call(:char, string, x, y)
end
