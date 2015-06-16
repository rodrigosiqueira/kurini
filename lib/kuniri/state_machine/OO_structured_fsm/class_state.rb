require_relative 'oo_structured_state.rb'

module StateMachine

  module OOStructuredFSM

    class ClassState < OOStructuredState

      @language

      def initialize (pLanguage)
        @language = pLanguage
      end

      def handle_line(pLine)
        if @language.methodHandler.get_method(pLine)
          method_capture
        elsif @language.constructorHandler.get_constructor(pLine)
          constructor_capture
        elsif @language.attributeHandler.get_attribute(pLine)
          attribute_capture
        elsif @language.moduleHandler.get_module(pLine)
          module_capture
        elsif @language.idleHandler.get_idle(pLine)
          idle_capture
        end
      end

      def method_capture
        @language.set_state(@language.methodState)
      end

      def constructor_capture
        @language.set_state(@language.constructorState)
      end

      def attribute_capture
        @language.set_state(@language.attributeState)
      end

      def module_capture
        @language.set_state(@language.moduleState)
      end

      def idle_capture
        @language.set_state(@language.idleState)
      end 

    # End class
    end

  # End OOStructuredFSM
  end

# 
end