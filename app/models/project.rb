class Project
	include Mongoid::Document
	include Mongoid::Timestamps

	field :stub, type: String
	field :title, type: String
	field :summary, type: String
	field :body, type: String
	field :category, type: String

	index({stub: 1}, {unique: true})
	index({category: 1}, {unique: false})

	before_create :generate_stub

	def self.get(stub)
		self.where(stub: stub).first
	end

	def to_param
		self.stub
	end

	def generate_stub
		stub = title.parameterize
		i = nil
		while Project.where(stub: stub + i.to_s).count > 0
			if i == nil
				i = 1
			else
				i += 1
			end
		end
		self.stub = stub + i.to_s
		true
	end
end