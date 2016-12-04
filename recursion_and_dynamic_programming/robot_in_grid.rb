# a robot starts in the upper-left corner of an r by c grid. The robot
# can move only right or down. Certain cells (marked false) are off-limits to the robot,
# so it can not enter them. Find a way for the robot to get to the
# bottom-right corner of the grid
#

def find_path(grid)
  to_walk = [[0, 0]]


end

def in_bounds?(location, height, width)
  location[0].between(0, height - 1) && location[1].between(0, width - 1)
end

# neighbors, working backward (where could the robot have been one move
# ago in order to end up at current point?)
def neighbors(point)
  neighbors = []
  deltas = [ [0, -1], [-1, 0]]
  deltas.each do |delta|
    neighbors.push([point[0] + delta[0], point[1] + delta[1]])
  end
  neighbors
end
