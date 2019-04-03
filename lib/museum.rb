class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    exhibits << exhibit
  end

  def recommend_exhibits(patron)
    exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    patrons << patron
    attend(patron)
  end

  def attend(patron)
    patron_exhibits = recommend_exhibits(patron)
    if patron_exhibits.length > 0
      cost_sorted = patron_exhibits.sort_by do |exhibit|
        exhibit.cost
      end
      cost_sorted.each do |exhibit|
        if exhibit.cost <= patron.spending_money
          patron.spend(exhibit)
        end
      end
    end
  end

  def patrons_by_exhibit_interest
    exhibit_hash = {}
    exhibits.each do |exhibit|
      exhibit_hash[exhibit] = []
      patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          exhibit_hash[exhibit] << patron
        end
      end
    end
    exhibit_hash
  end

end
