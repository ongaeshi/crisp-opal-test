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
