class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    @@all << self
  end

  def self.save(name:, type:, db:)
    pk = self.new(name, type)
    db.execute("Insert into pokemon(name, type) values (?, ?)", pk.name, pk.type)
  end

end
