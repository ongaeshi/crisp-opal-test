def setup(title, description, options)
  win = Native(`window`)
  win[:title] = title
  win[:description] = description
  win[:options] = options.to_n
end

def rect(x, y, width, height)
  JS.call(:rect, x, y, width, height)
end

def box(x, y, width, height)
  JS.call(:box, x, y, width, height)
end
