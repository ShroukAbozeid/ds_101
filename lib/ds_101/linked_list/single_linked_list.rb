# frozen_string_literal: true

require_relative "common"
module Ds101
  module LinkedList
    class SingleLinkedList
      include Ds101::LinkedList::Common
      attr_accessor :head, :tail, :length

      def initialize
        @head = nil
        @tail = nil
        @length = 0
      end

      def self.init_from_arr(arr)
        list = SingleLinkedList.new
        arr.each do |value|
          list.append(value)
        end
        list
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
        current = current.next while current&.next && current.next.value != value
        return unless current&.next

        if current.next == tail
          @tail = current
        else
          current.next = current.next.next
        end
        @length -= 1
      end

      def remove_head
        if head.next.nil?
          @head = nil
          @tail = nil
        else
          @head = head.next
        end
        @length -= 1
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
