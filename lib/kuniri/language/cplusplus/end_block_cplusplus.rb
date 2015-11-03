require_relative '../abstract_container/structured_and_oo/end_block'

module Languages

  module Cplusplus

    class EndBlockCplusplus < Languages::EndBlock

      public

        def has_end_of_block?(pLine)
          return detect_end(pLine)
        end

      protected

        def detect_end(pLine)
          return true if pLine =~ /\}\s*$|\}$/
          return false
        end

    # Class
    end

  # Cplusplus
  end

# Module
end