# -*- coding: utf-8 -*-

class ${1:Main}
  def initialize
    nil
  end


  def ${2:some_method}
    $0    
    return nil
  end
end

if __FILE__ == $PROGRAM_NAME
  h = $1.new
  h.$2
end
