class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_status
    @switch
  end
  
  private

    attr_writer :switch

    def flip_switch(desired_state)
      self.switch = desired_state
    end

end

m = Machine.new
m.start
puts m.switch_status
