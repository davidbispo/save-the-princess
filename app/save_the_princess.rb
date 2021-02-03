class SaveThePrincess
  class << self
    def displayPathtoPrincess(n, grid)
      board_rows = grid.collect{ |e| e ? e.strip : e }
      coordinates = {}
      board_rows.each_with_index do |row, row_index|
        princess_col, player_col = [ row.index('p'), row.index('m') ]

        coordinates['player'] = [player_col, row_index] unless !player_col
        coordinates['princess'] = [princess_col, row_index] unless !princess_col
      end
      player_x, player_y = coordinates['player']
      pr_x, pr_y = coordinates['princess']

      delta_x = pr_x - player_x
      delta_y = pr_y - player_y

      moves = []

      (1..delta_y.abs).each do |n|
        if delta_y < 0
          moves << "UP\n"
          next
        end
        moves << "DOWN\n"
      end

      (1..delta_x.abs).each do |n|
        if delta_x < 0
          moves << "LEFT\n"
          next
        end
        moves << "RIGHT\n"
      end
      print moves.join('')
    end
  end
end