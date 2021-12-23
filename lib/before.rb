def rect(x, y, width, height)
  JS.call(:rect, x, y, width, height)
end

def box(x, y, width, height)
  JS.call(:box, x, y, width, height)
end
