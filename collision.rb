def update
  color("purple")
  box(50, 50, 20, 10)
  color("green")
  # Check if the drawn figure collides a rect/text/char.
  # [Drawing function].isColliding => {
  #   rect.[color]: boolean;
  #   text.[char]: boolean;
  #   char.[char]: boolean;
  # }
  # If the drawing box collides the purple rect...
  # if (box(input.pos, 5, 5).isColliding.rect.purple) {
  #   end();
  # }
  if input.is_pressed
    box(10, 10, 5, 5)
  end
end
