class Traverler
  def initialize(filename, right_steps, down_steps)
    @right_steps = right_steps
    @down_steps = down_steps

    partial_map = []
    File.open(filename).readlines.map do |line|
      partial_map << line.chomp.split('')
    end
    @map = get_full_map partial_map
  end

  def travel
    curr_pos, tree_count = [0, 0], 0
    while not stuck? @map, curr_pos do
      pos = curr_pos.dup
      curr_pos[0] += @right_steps
      curr_pos[1] += @down_steps
      tree_count += 1 if @map[curr_pos[1]][curr_pos[0]] == "#"
    end
    tree_count
  end

  private # Over kill LOL

  def get_full_map(partial_map)
    # ((hight * right_steps) / (width * down_steps)) + 1
    n = ((partial_map.length * @right_steps) / 
      (partial_map.first.length * @down_steps)) + 1
    partial_map.map { |row| row * n }
  end

  def stuck?(map, pos)
    pos[0] + @right_steps >= map.first.length or
      pos[1] + @down_steps >= map.length
  end
end

