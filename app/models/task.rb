class Task < Tableless
  unloadable

  column :id, :titulo
  validates_presence_of :id

end
