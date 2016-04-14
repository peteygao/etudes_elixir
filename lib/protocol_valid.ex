defprotocol Valid do
  @doc """
  Returns true if data within the struct is considered valid
  Etudes 7-4
  """
  def valid? data
end
