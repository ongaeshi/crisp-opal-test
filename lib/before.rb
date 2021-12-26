def setup(opts = {})
  win = Native(`window`)
  win[:title] = opts[:title] if opts[:title]
  win[:description] = opts[:description] if opts[:description]
  win[:options] = opts[:options].to_n if opts[:options]
end

def rect(x, y, width, height)
  JS.call(:rect, x, y, width, height)
end

def box(x, y, width, height)
  JS.call(:box, x, y, width, height)
end
