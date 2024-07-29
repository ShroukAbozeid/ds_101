# frozen_string_literal: true

require_relative "common"
module Ds101
  module LinkedList
    class DoubleLinkedList
      include Ds101::LinkedList::Common
      attr_reader :head, :tail, :length

      class Node
        attr_accessor :value, :next, :prev

        def initialize(value:, next_node: nil, prev_node: nil)
          @value = value
          @next = next_node
          @prev = prev_node
        end
      end

      def initialize
        @head = nil
        @tail = nil
        @length = 0
      end

      def self.init_from_arr(arr)
        list = DoubleLinkedList.new
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
          node.prev = tail
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
          @tail.next = nil
        else
          current.next = current.next.next
          current.next.prev = current
        end
        @length -= 1
      end

      def remove_head
        if head.next.nil?
          @head = nil
          @tail = nil
        else
          head.next.prev = nil
          @head = head.next
        end
        @length -= 1
      end
    end
  end
end
