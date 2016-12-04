# given a 'sreen' (2-D array of colors), a point, and a new color, fill in
# the surrounding area until the color changes from the original color
# (similar to paint bucket tool in MS paint and similar)
def paint_fill(screen, point, new_color)
  seen = {}
  old_color = color(point, screen)
  to_fill = [point]

  until to_fill.empty? do
    current_point = to_fill.shift
    screen[current_point[0]][current_point[1]] = new_color
    neighbors(current_point, screen.length, screen.first.length).each do |neighbor|
      if !seen[neighbor] && color(neighbor, screen) == old_color
        to_fill.push(neighbor)
        seen[neighbor] = true
      end
    end
  end

  render screen
end

# return all the perpendicularly adjacent neighbors of a given point
def neighbors(point, scr_height, scr_width)
  deltas = [ [0, 1], [0, -1],
             [1, 0], [-1, 0] ]
  neighbors = []
  deltas.each do |delta|
    neighbor = [point[0] + delta[0], point[1] + delta[1]]
    neighbors.push(neighbor) if in_bounds?(neighbor, scr_height, scr_width)
  end
  neighbors
end

# clean up determining color at point on grid
def color(point, screen)
  screen[point[0]][point[1]]
end

# does point exist on screen?
def in_bounds?(point, scr_height, scr_width)
  point[0].between?(0, scr_height-1) && point[1].between?(0, scr_width-1)
end

def render(screen)
  screen.each { |row| p row }
end


screen = [
  [1, 1, 2, 3],
  [1, 1, 2, 3],
  [1, 2, 2, 3],
  [1, 1, 2, 3],
  [2, 1, 2, 3],
]

paint_fill(screen, [0, 2], 4)
