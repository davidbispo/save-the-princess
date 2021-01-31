class SavePrincess
  def self.parse_board(input)
    raw = input.split('\n')
    board_l = raw[0]
    board_rows = raw.slice[1, -1]
    
    board_rows.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        return { 
          me: my_position, princess: princess_position 
          } unless princess_position && my_position

        if board_rows[row_idx][col_idx] == 'p' 
          princess_position = [row_idx, col_idx]
        end 
        if board_rows[row_idx][col_idx] == 'm'
          my_position = [row_idx, col_idx]
        end
      end
    end
  end

  def self.save(input_positions)
    me_x, me_y = input_positions['me']
    pr, pr_y = input_positions['princess']

    delta_x = pr_x - me_x
    delta_y = pr_y - me_y

    nmoves = abs(delta_x) + abs(delta_y)

    (1..delta_y).each do |n|
      if delta_y > 0 
        print ("DOWN \n") 
        next
      end
      print ("UP \n")
    end
    
    (1..delta_x).each do |n|
      if delta_x > 0 
        print ("LEFT \n")
        next
      end
      print ("RIGHT \n")
    end
  end
end