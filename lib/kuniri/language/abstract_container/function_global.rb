require_relative 'function'

module Languages

  # @abstract Method Abstract class for handling method
  class FunctionGlobal < Languages::Function

    public

      # Based on the line, verify if line has a method and return it.
      # @param pLine String with potencial method.
      # @return Return a Method class, or nil if line doesn't have method.
      def get_function_global(pLine)
        get_function(pLine)
      end

  # Class
  end

# Languages
end