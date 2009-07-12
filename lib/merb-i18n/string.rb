class String
  def t(*args)
    R18n.get.send(self, *args)
  end
end