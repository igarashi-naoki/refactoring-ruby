class Haggis
  def initialize

  end

  def distance_traveled(time)
    if secondary_time(time) > 0
      total_distance = primary_distance(primary_time(time)) + primary_vel * secondary_time(time) + 5 *
                       secondary_acc * secondary_time(time) * secondary_time(time)
    end
    total_distance
  end

  private

  def primary_acc
    @primary_force / @mass
  end

  def primary_distance(primary_time)
    0.5 * primary_acc * primary_time * primary_time
  end

  def primary_time(time)
    [time, @delay].min
  end

  def secondary_time(time)
    time - @delay
  end

  def secondary_acc
    (@primary_force + @secondary_force) / @mass
  end

  def primary_vel
    primary_acc * @delay
  end
end
