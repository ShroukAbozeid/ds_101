require 'spec_helper'

RSpec.describe Ds101::LinkedList::SingleLinkedList do
  let(:list) { Ds101::LinkedList::SingleLinkedList.new }

  describe "#initialize" do
    it "should create an empty list" do
      expect(list.head).to be_nil
      expect(list.tail).to be_nil
      expect(list.length).to eq(0)
    end
  end

  describe "#append" do
    context 'when no nodes at the list' do
      it "should add a new node at the head of the list" do
        list.append(1)
        expect(list.head.value).to eq(1)
      end
    end
    context 'when no nodes at the list' do
      it "should add a new node at the tail of the list" do
        list.append(1)
        list.append(2)
        expect(list.tail.value).to eq(2)
      end
    end

    it 'increase length' do
      expect{ list.append(4) }.to change(list, :length).by(1)
    end
  end

  describe '#remove' do
    context 'when no nodes at the list' do
      it 'doesnt change length' do
        expect { list.remove(5) }.not_to change(list, :length)
      end
    end

    context 'when value not found' do
      it 'doesnt change length' do
        list.append(4)
        expect { list.remove(5) }.not_to change(list, :length)
      end
    end

    
    context 'when value found at head' do
      it 'changes length' do
        list.append(4)
        expect { list.remove(4) }.to change(list, :length).by(-1)
      end
      
      it 'updates head' do
        list.append(4)
        list.append(5)
        list.remove(4)
        expect(list.head.value).to eq(5)
      end
    end

    context 'when value is found at tail' do
      it 'changes length' do
        list.append(5)
        list.append(4)
        expect { list.remove(4) }.to change(list, :length).by(-1)
      end
      
      it 'updates tail' do
        list.append(4)
        list.append(6)
        list.append(5)
        list.remove(5)
        expect(list.tail.value).to eq(6)
      end
    end

    context 'when value is found in the middle' do
      it 'changes length' do
        list.append(5)
        list.append(4)
        list.append(6)
        expect { list.remove(4) }.to change(list, :length).by(-1)
      end
      
      it 'updates pointers' do
        node1 = list.append(4)
        node2 = list.append(6)
        node3 = list.append(5)
        list.remove(6)
        expect(node1.next).to eq(node3)
      end
    end
  end

  describe '#clear' do
    before do
      list.append(4)
      list.append(5)
      list.append(6)
      list.clear
    end
    it 'reset length to 0' do
      expect(list.length).to eq(0)
    end

    it 'sets tail to nil' do
      expect(list.tail).to be_nil
    end

    it 'sets head to nil' do
      expect(list.head).to be_nil
    end
  end

  describe '#find' do

    context 'when value is found at head' do
      it 'returns head' do
        list.append(5)
        expect(list.find(5)).to eq(list.head)
      end
    end

    context 'when value is found at tail' do
      it 'returns head' do
        list.append(5)
        list.append(4)
        list.append(6)
        expect(list.find(6)).to eq(list.tail)
      end
    end

    context 'when value is found at the middle' do
      it 'returns node' do
        list.append(5)
        node = list.append(4)
        list.append(6)
        expect(list.find(4)).to eq(node)
      end
    end

    context 'when duplicated values exists' do
      it 'returns first node' do
        list.append(5)
        node = list.append(4)
        list.append(4)
        list.append(6)
        expect(list.find(4)).to eq(node)
      end
    end

    context 'when value is not found' do
      it 'returns nil' do
        node1 = list.append(5)
        expect(list.find(6)).to be_nil
      end
    end
  end

  describe '#find_by' do
    context 'when block returns true for head' do
      it 'returns head' do
        list.append(8)
        list.append(5)
        node = list.find_by {|node| node.value.even?}
        expect(node).to eq(list.head)
      end
    end

    context 'when block returns true for tail' do
      it 'returns tail' do
        list.append(8)
        list.append(4)
        list.append(5)
        node = list.find_by {|node| node.value.odd?}
        expect(node).to eq(list.tail)
      end
    end

    context 'when block returns true for middle' do
      it 'returns node' do
        list.append(8)
        node1 = list.append(9)
        list.append(5)
        node2 = list.find_by {|node| node.value % 3 == 0}
        expect(node2).to eq(node1)
      end
    end

    context 'when block returns true for multiple nodes' do
      it 'returns first node' do
        list.append(8)
        node1 = list.append(9)
        list.append(12)
        list.append(5)
        node2 = list.find_by {|node| node.value % 3 == 0}
        expect(node2).to eq(node1)
      end
    end
  end

  describe '#each' do
    it 'runs block for each node' do
      list.append(4)
      list.append(5)
      list.each { |node| node.value +=2 }
      expect(list.head.value).to eq(6)
      expect(list.tail.value).to eq(7)
    end
  end

  describe '#concat' do
    before do
      list.append(4)
      list.append(5)
      list2 = Ds101::LinkedList::SingleLinkedList.new
      list2.append(6)
      list2.append(7)
      list2.append(8)
      list.concat(list2)
    end
    it 'updats length' do
      expect(list.length).to eq(5)
    end

    it 'concats the second list to the end of the first list' do
      arr = []
      list.each { |node| arr << node.value }
      expect(arr).to eq([4,5,6,7,8])
    end
  end

  describe '#init_from_arr' do
    let(:list2) {Ds101::LinkedList::SingleLinkedList.init_from_arr([1,2,3,4,5])}
    it 'update length' do
      expect(list2.length).to eq(5)
    end

    it 'create list from array' do
      arr = []
      list2.each { |node| arr << node.value }
      expect(arr).to eq([1,2,3,4,5])
    end
  end

  describe '#to_a' do
    it 'converts list to array' do
      list2 = Ds101::LinkedList::SingleLinkedList.init_from_arr([1,2,3,4,5])
      expect(list2.to_a).to eq([1,2,3,4,5])
    end
  end
end
