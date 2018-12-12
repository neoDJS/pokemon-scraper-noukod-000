class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db: SQLite3::Database.new('db/pokemon.db'), hp: "")
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
    @@all << self
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon set hp = ? WHERE id = ?", hp, self.id)
  end

  def self.save(name, type, db)
    db.execute("Insert into pokemon(name, type) values (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * from pokemon where id = ?", id)[0]
    self.new(id: row[0], name: row[1], type: row[2], db: db, hp: row[3])
  end

end
