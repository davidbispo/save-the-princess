
class SavePrincessTwo
  class << self
    def nextMove(n,r,c,grid)
      coordinates = {}
      raw = grid.split("\n")
      board_rows = raw.collect{ |e| e ? e.strip : e }
      board_rows.each_with_index do |row, row_index|
        princess_col, player_col = [ row.index('p'), row.index('m') ]

        coordinates['player'] = [row_index, player_col] unless !player_col
        coordinates['princess'] = [row_index, princess_col] unless !princess_col
      end

      player_x, player_y = coordinates['player']
      pr_x, pr_y = coordinates['princess']

      delta_x, delta_y = pr_x - [ player_x , pr_y - player_y ]
      hor_mov_necessary, ver_mov_necessary = [ delta_x != 0, delta_y != 0 ]

      get_directions_x = ->(dx) { dx < 0 ? 'LEFT' : 'RIGHT' }
      get_directions_y = ->(dy) { dy < 0 ? 'UP' : 'DOWN' }

      if !hor_mov_necessary && ver_mov_necessary
        # return delta_y < 0 ? print('UP') : print('DOWN')
        return get_directions_y.call(delta_x)

      end
      if !ver_mov_necessary && hor_mov_necessary
        # return delta_x < 0 ? print('LEFT') : print('RIGHT')
        return get_directions_y.call(delta_y)
      end

      is_equidistant_from_princess = delta_x == delta_y
      if is_equidistant_from_princess
        can_go_to = []
        can_go_to << get_directions_y.call(delta_x)
        can_go_to << get_directions_y.call(delta_x)
        return can_go_to.sample
      end

      smallest_distance_position = [ delta_x, delta_y ].each_with_index.min[1]
      return smallest_distance_position == 0 ?
        get_directions_y.call(delta_x) :
        get_directions_x.call(delta_y)
    end
  end
end