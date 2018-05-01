require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
class PlayWright
  attr_accessor :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|datum| PlayWright.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.find_by_name(name)
    found = PlayDBConnection.instance.execute("SELECT * FROM playwrights WHERE name = #{name}")
    return nil if found.empty?
    PlayWright.new(found.pop)

  end

  def create
    raise "#{self} already in database: playwrights" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year )
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id

  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE playwrights
      SET name = ?, birth_year = ?
      WHERE id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless @id
    plays = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT *
      FROM plays
      WHERE playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end



end
class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Play.new(datum) }
  end


  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def find_by_title(title)
    find_me = title
    found = PlayDBConnection.instance.execute(<<-SQL, find_me)
      SELECT *
      FROM plays
      WHERE plays.title = ?

    SQL
    return nil if found.empty?

    Play.new(found.pop)
  end

  def find_by_playwrite(playwright)
    found = PlayDBConnection.instance.execute(<<-SQL, playwright)
      SELECT *
      FROM plays
      JOIN playwrights
      ON plays.playwright_id = playwrights.id
      WHERE playwrights.name = ?

    SQL

    found.map {|play| Play.new(play)}
  end






end
