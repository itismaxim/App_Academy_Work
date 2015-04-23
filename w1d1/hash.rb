class MyHashSet
	def initialize
		@store = {}
	end

	def include? (el)
		@store.has_key? (el)
	end

	def insert (el)
		@store[el] = true
	end
	
	def delete (el)
		if include?(el)
			@store.delete(el)
			true
		else
			false
	end
	
	def to_a
		result = []
		@store.each_key do |key|
			result << key
		end
		result
	end
	
	def self.union(set2)
		@store.merge(set2)
	end
	
	def self.intersect(set2)
		result = {}
		self.each do |set1_key|
			set2.each do |set2_key|
			end
		end
	end
	
	def self.minus (set2)
		result_array = to_a
		set2.each_key do |key|
			delete(key) if include?(key)
		end
	end
end
=begin
Next, write a method set1#union(set2) which returns a new set which includes all the elements in EITHER 
set1 or set2. Write a set1#intersect(set2) method that returns a new set which includes only those elements 
that are in BOTH set1 and set2.

Write a set1#minus(set2) method which returns a new set which includes all the items of set1 that aren't in set2.
=end