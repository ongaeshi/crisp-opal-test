setup(
  options: {
    isShowingScore: false
  }
)

def update
  # box
  x = 0
  color("red")
  box(x + 5, 5, 5, 10)
  box(x + 5, 15, 5)
  box(vec(x + 5, 25), 5, 10)
  box(vec(x + 5, 35), 5)

  # rect
  x = 20
  color("blue")
  rect(x, 0, 10, 5)
  rect(x, 10, 5)
  rect(vec(x, 20), 10, 5)
  rect(vec(x, 30), 5)

  # bar
  x = 40
  color("yellow")
  bar(x + 5, 5, 8, 3, PI * 0.25, 0.5)
  bar(x + 5, 15, 8, 3, PI * 0.25)
  bar(x + 5, 25, 8, 3)
  bar(vec(x + 5, 35), 8, 3, PI * 0.25, 0.5)
  bar(vec(x + 5, 45), 8, 3, PI * 0.25)
  bar(vec(x + 5, 55), 8, 3)

  # line
  x = 60
  color("green")
  y = 0
  line(x, y, x + 15, y + 10, 4)
  y = 10
  line(x, y, x + 15, y + 10)
  y = 20
  line(vec(x, y), x + 15, y + 10, 4)
  y = 30
  line(vec(x, y), x + 15, y + 10)
  y = 40
  line(vec(x, y), vec(x + 15, y + 10), 4)
  y = 50
  line(vec(x, y), vec(x + 15, y + 10))

  # arc
  x = 90
  color("purple")
  arc(x, 5, 3, 2, 0, PI)
  arc(x, 15, 3, 2, 0)
  arc(x, 25, 3, 2)
  arc(x, 35, 3)
  arc(vec(x, 45), 3, 2, 0, PI)
  arc(vec(x, 55), 3, 2, 0)
  arc(vec(x, 65), 3, 2)
  arc(vec(x, 75), 3)
end
