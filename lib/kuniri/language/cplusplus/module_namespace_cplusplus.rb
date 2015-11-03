require_relative '../abstract_container/structured_and_oo/module_namespace'
require_relative '../container_data/structured_and_oo/module_namespace_data'

module Languages

  module Cplusplus

    # Class for handling Cplusplus module
    class ModuleNamespaceCplusplus < Languages::ModuleNamespace

      public

        def get_module(pLine)
          result = detect_module(pLine)
          return nil unless result

          result = remove_unnecessary_information(result)
          moduleCaptured = Languages::ModuleNamespaceData.new(result)

          return moduleCaptured
        end

      protected

        def detect_module(pLine)
          regexExpression = /^\s*namespace\s+(\w*)/
          return nil unless pLine =~ regexExpression
          return pLine.scan(regexExpression).join("")
        end

        def remove_unnecessary_information(pLine)
          return pLine.gsub(/\s/, "") if pLine =~ /\s/
          return pLine
        end

    # class
    end

  # Cplusplus
  end

# module
end