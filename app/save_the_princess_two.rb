
class SaveThePrincessTwo
  class << self
    def nextMove(n,r,c,grid)
      coordinates = {}
      board_rows = grid.collect{ |e| e ? e.strip : e }
      board_rows.each_with_index do |row, row_index|
        princess_col, player_col = [ row.index('p'), row.index('m') ]

        coordinates['player'] = [player_col, row_index] unless !player_col
        coordinates['princess'] = [ princess_col, row_index ] unless !princess_col
      end

      player_x, player_y = coordinates['player']
      pr_x, pr_y = coordinates['princess']

      delta_x, delta_y =  [ (pr_x - player_x) , (pr_y - player_y) ]
      hor_mov_necessary, ver_mov_necessary = [ delta_x != 0, delta_y != 0 ]

      get_directions_x = ->(dx) { dx < 0 ? 'LEFT' : 'RIGHT' }
      get_directions_y = ->(dy) { dy < 0 ? 'UP' : 'DOWN' }

      if !hor_mov_necessary && ver_mov_necessary
        move = get_directions_y.call(delta_y)
      end

      if !ver_mov_necessary && hor_mov_necessary
        move = get_directions_x.call(delta_x)
      end

      is_equidistant_from_princess = delta_x.abs == delta_y.abs
      if is_equidistant_from_princess
        can_go_to = []
        can_go_to << get_directions_y.call(delta_y)
        can_go_to << get_directions_x.call(delta_x)
        move = can_go_to.sample
      end

      largest_distance_position = [ delta_x, delta_y ].map(&:abs).each_with_index.max[1]
      move = largest_distance_position == 0 ?
        get_directions_x.call(delta_x) :
        get_directions_y.call(delta_y)
      print(move)
      return (move)
    end
  end
end