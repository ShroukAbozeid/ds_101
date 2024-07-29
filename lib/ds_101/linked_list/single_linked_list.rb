module Ds101
  module LinkedList
    class SingleLinkedList
      attr_accessor :head, :tail, :length

      def initialize
        @head = nil
        @tail = nil
        @length = 0 
      end

      def append(value)
        node = Node.new(value: value)
        if head.nil?
          @head = node
        else
          tail.next = node
        end
        @tail = node
        @length += 1
        node
      end

      def remove(value)
        return unless head
        return remove_head if head.value == value
       
        current = head
        while current && current.next && current.next.value != value
          current = current.next
        end
        return unless (current && current.next)
    
        if current.next == tail
          @tail = current
        else
          current.next = current.next.next
        end
        @length-=1
      end

      def remove_head
        if head.next.nil?
          @head = nil
          @tail = nil
        else
          @head = head.next
        end
        @length-=1
      end

      def find(value)
        current = head
        while current && current.value != value
          current = current.next
        end
        current
      end

      def find_by &block
        current = head
        while current
          return current if block.call(current)
          current = current.next
        end
        nil
      end

      def each &block
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

      def self.init_from_arr(arr)
        list = SingleLinkedList.new
        arr.each do |value|
          list.append(value)
        end
        list
      end

      def to_a
        arr = []
        each do |node|
          arr << node.value
        end
        arr
      end

      def clear
        while length >0
          remove_head
        end
      end
      class Node
        attr_accessor :value, :next
        def initialize(value:, next_node: nil)
          @value = value
          @next = next_node
        end
      end
    end
  end
end