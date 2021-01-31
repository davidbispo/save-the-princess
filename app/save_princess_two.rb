
class SavePrincessTwo
  class << self
    def nextMove(n,r,c,grid)
      #
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

      delta_x = pr_x - player_x
      delta_y = pr_y - player_y
    end
  end
end