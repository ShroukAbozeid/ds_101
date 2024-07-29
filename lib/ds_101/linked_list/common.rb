# frozen_string_literal: true

module Ds101
  module LinkedList
    module Common
      def find(value)
        current = head
        current = current.next while current && current.value != value
        current
      end

      def find_by(&block)
        current = head
        while current
          return current if block.call(current)

          current = current.next
        end
        nil
      end

      def each
        current = head
        while current
          yield current
          current = current.next
        end
      end

      def concat(other_list)
        other_list.each do |node|
          append(node.value)
        end
      end

      def to_a
        arr = []
        each do |node|
          arr << node.value
        end
        arr
      end

      def clear
        remove_head while length.positive?
      end
    end
  end
end
